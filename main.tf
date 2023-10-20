resource "aws_instance" "kimmigs-ec2" {
 ami           = var.ami 
 instance_type = var.instance_type
 key_name = var.key_pair

 tags = {
   Name = var.name_tag
 }
}

