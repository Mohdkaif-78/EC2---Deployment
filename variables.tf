variable "aws_region" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "instance_name" {
  default = "Task-2"
}

variable "key_pair_name" {
  description = "cloud watch-demo"
}

variable "allowed_ssh_cidr" {
  description = "152.57.157.121/32"
}