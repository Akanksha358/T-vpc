data "aws_secretsmanager_secret_version" "rds_password" {
    secret_id = "test/terraform/rds/master-password"
}
#SG for RDS
resource "aws_security_group" "T_rds_sg" {
    name = "T-RDS-SG"
    vpc_id = var.vpc_id
    lifecycle {
        create_before_destroy = true       
    }
    ingress {
        description     = "MySQL access from private EC2"
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        security_groups = [var.private_ec2_sg_id]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags = { Name = "T-rds-sg"}
}
#Subnet group for RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "t-rds-subnet-group"
    subnet_ids = var.subnet_ids
     lifecycle {
        create_before_destroy = true       
    }
    tags = { Name = "Trds-subnet-group"}
}



# ─── RDS INSTANCE ─────────────────────────────────────
resource "aws_db_instance" "rds_instance" {
  identifier = var.rds_instance_identifier
  engine     = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class

  db_name = var.db_name
  username = var.db_user
  password = data.aws_secretsmanager_secret_version.rds_password.secret_string
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.T_rds_sg.id]

  allocated_storage       = 20
  storage_type            = "gp2"
  multi_az = false
  skip_final_snapshot     = true
  publicly_accessible     = false


   lifecycle {
    create_before_destroy = true       
  }

   tags = { Name = "private-rds-instance" }
}