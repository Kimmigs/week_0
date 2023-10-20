
output "public_ip" {
 value       = aws_instance.kimmigs-ec2.public_ip
 description = "Public IP Address of EC2 instance"
}

output "instance_id" {
 value       = aws_instance.kimmigs-ec2.id
 description = "Instance ID"
}
