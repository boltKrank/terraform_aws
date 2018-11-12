# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami = "ami-d5c2e8e5"
  subnet_id = "subnet-af8532d8"
  key_name = "aws-simon"
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20
    volume_type = "gp2"
    delete_on_termination = true
  }
  instance_type = "t2.large"
  tags {
    Name = "simon anderson test"
    lifetime = "2h"
  }
  security_groups = ["sg-02f5b01353dc0b079"]
}
