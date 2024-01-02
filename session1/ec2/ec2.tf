# create  ec2
resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-allow-all.id] # list of SGs

  tags = {
    Name = "Terraform-1"
  }
}


#create SG

resource "aws_security_group" "roboshop-allow-all" { # this is only for terraform ref 
  name        = "var.sg-name" # this is for aws ref 
  description = "Allow All For Roboshop"

  ingress {
    description      = "Allow All Ports"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-allow-all"
  }
}