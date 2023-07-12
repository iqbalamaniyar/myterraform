resource "aws_instance" "myaws" {
    ami = "ami-0f5ee92e2d63afc18"
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "Jen"
    vpc_security_group_ids = [ aws_security_group.Team]
    subnet_id = module.vpc.public_subnets[0]
    tags = {
      "Name" = "myaws"
    }
      connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
        host = aws_instance.myaws.public_ip 
      }

  provisioner "remote-exec" {
    inline = [
              "sudo apt update",
              "sudo apt install maven -y"
    ]
  } 
  depends_on = [
      module.vpc,
      aws_security_group.Team
    ]   

}