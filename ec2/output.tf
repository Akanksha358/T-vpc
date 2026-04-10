output "public_ec2_id" {
  value = aws_instance.public_ec2.id
}

output "public_ec2_public_ip" {
  value = aws_instance.public_ec2.public_ip
}

output "private_ec2_id" {
  value = aws_instance.private_ec2.id
}

output "private_ec2_private_ip" {
  value = aws_instance.private_ec2.private_ip
}

output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

output "private_sg_id" {
  value = aws_security_group.private_sg.id
}

output "public_key_name" {
  value = aws_key_pair.public_key.key_name
}

output "private_key_name" {
  value = aws_key_pair.private_key.key_name
}