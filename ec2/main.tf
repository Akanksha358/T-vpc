# resource "aws_key_pair" "public_key" {
#   key_name   = "public-ec2-key"
#   public_key = var.public_ec2_public_key
#   tags       = { Name = "public-ec2-key" }
# }

# resource "aws_key_pair" "private_key" {
#   key_name   = "private-ec2-key"
#   public_key = var.private_ec2_public_key
#   tags       = { Name = "private-ec2-key" }
# }
# Fetch keys from Secrets Manager
data "aws_secretsmanager_secret_version" "public_instance_key_pub" {
  secret_id = "prod/ec2/public-instance-key-pub"
}

data "aws_secretsmanager_secret_version" "private_instance_key_pub" {
  secret_id = "prod/ec2/private-instance-key-pub"
}

# Key pair resources now read from Secrets Manager
resource "aws_key_pair" "public_key" {
  key_name   = "public-ec2-key"
  public_key = data.aws_secretsmanager_secret_version.public_instance_key_pub.secret_string
  tags       = { Name = "public-ec2-key" }
}

resource "aws_key_pair" "private_key" {
  key_name   = "private-ec2-key"
  public_key = data.aws_secretsmanager_secret_version.private_instance_key_pub.secret_string
  tags       = { Name = "private-ec2-key" }
}
# ─── SECURITY GROUP — PUBLIC EC2 ──────────────────────
resource "aws_security_group" "public_sg" {
  name   = "T-public-ec2-sg"
  vpc_id = var.vpc_id
  lifecycle {
    create_before_destroy = true          
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "T-public-ec2-sg" }
}

# ─── SECURITY GROUP — PRIVATE EC2 ─────────────────────
resource "aws_security_group" "private_sg" {
  name   = "T-private-ec2-sg"
  vpc_id = var.vpc_id
   lifecycle {
    create_before_destroy = true       
  }

  ingress {
    description     = "SSH only from public EC2"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "T-private-ec2-sg" }
}


# ─── PUBLIC EC2 ───────────────────────────────────────
resource "aws_instance" "public_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.public_key.key_name
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  tags = { Name = "T-public-ec2" }
}
# ─── PRIVATE EC2 ──────────────────────────────────────
resource "aws_instance" "private_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  key_name               = aws_key_pair.private_key.key_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    yum install -y python3-pip
    pip3 install boto3
  EOF

  tags = { Name = "T-private-ec2" }
}