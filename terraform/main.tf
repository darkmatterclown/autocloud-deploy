provider "aws" {
    region = "us-east-1"

}

resource "aws_s3_bucket" "tf_state" {
    bucket = "autocloud-tfstate-bucket"
    versioning { enabled = true }
}

resource "aws_instance" "web" {
    ami = data.aws_ssm_parameter.al2023_ami.value
    instance_type = "t2.micro"
    key_name = "Amshulkey"
    user_data = file("setup.sh")
    tags = {
         Name = "CI-CD-Web" 
         }
}
data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}