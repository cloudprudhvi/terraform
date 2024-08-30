# resource "aws_instance" "sample" {
#   count         = 2
#   ami           = "ami-08e2ed24aa233a8cb"
#   instance_type = "t2.micro"
#   subnet_id     = "subnet-0687120a626024f89"
#   tags = {
#     Name = "demo-${count.index}"
#   }
# }
variable "ec5" {
  type = map(string)
  default = {
    "1" = "t2.micro"
   # "2" = "t3.medium"
   # "test" = "t2.micro"
  }
}

#file provisoner  copying files   #shell script for installing httpd
#local-exec provisoner  local commands run
#remote-exec provisoner   ec2 server commands

resource "aws_instance" "this" {
  for_each      = var.ec5
  ami           = "ami-08e2ed24aa233a8cb"
  instance_type = each.value
  subnet_id     = "subnet-0687120a626024f89"
  key_name = "sample"
  tags = {
    Name = "demo-${each.key}"
  }
  provisioner "file" {
    source = "httpd.sh"
    destination = "/home/ec2-user/httpd.sh"
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("keypair/sample.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("keypair/sample.pem")
    host = self.public_ip
  }
    inline = [ 
      "chmod +x /home/ec2-user/httpd.sh",
      "sudo /home/ec2-user/httpd.sh"
     ]
  }
}


#taint
#untaint
#workspace     dev/stage/prod


#terraform workspace new dev
