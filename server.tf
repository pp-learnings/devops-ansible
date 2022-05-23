provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name = "pp-ec2-key"

  tags = {
    Name = "pp-devops-server-3"
    env = "production"
    owner = "ppethe"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

