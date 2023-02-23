provider "aws" {
  region = "us-east-2"
  access_key = "AKIA4JO5BYXWSOLPXAKL"
  secret_key = "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"
}

resource "aws_instance" "ec2" {
  ami ="ami-0ab0629dba5ae551d"
  instance_type = "t2.micro"
  key_name = "terraform"
  
 tags ={
    Name="EC2Terraform"
    Batch ="5am"
 }
}

resource "aws_security_group" "security" {
  
  name = "new_sg"
  description = "new_sg"

  ingress {
    protocol = "tcp"
    from_port = "22"
    to_port = "22"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  lifecycle {
    create_before_destroy = true
}
}
