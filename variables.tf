variable "ami" {
   type        = string
   description = "Ami/Ubuntu"
   default     = "ami-0261755bbcb8c4a84"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "key_pair" {
  type = string
  description = "Key pair"
  default = "key_pair"
}


variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "My EC2 Instance"
}

