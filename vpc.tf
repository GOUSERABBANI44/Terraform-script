#Create the vpc
provider "aws" {
  region     = "us-west-1"
  access_key = "AKIA352V5INCBUYKAMX2"
  secret_key = "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"
}
#Create the vpc
resource "aws_vpc" "mvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
#you dont want to destroy the source then use this script
# lifecycle {
#  prevent_destroy = true
#}
}
