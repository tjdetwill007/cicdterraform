resource "aws_instance" "myserver" {
  ami                     = "ami-08a52ddb321b32a8c"
  instance_type           = var.instance_type
  security_groups         = [ var.secg ]
  iam_instance_profile = var.instanceprofile
  subnet_id = "${var.subnet}"
  key_name = "myserver"
  
  tags = {
    Name = var.instance_name
  }
  # provisioner "remote-exec" {
  #   script = "../modules/ec2/install_codedeployagent.sh"

  #   connection {
  #     agent       = false
  #     type        = "ssh"
  #     user        = "ec2-user"
  #     host = aws_instance.myserver.public_ip
  #     private_key = "${file("C:\\Users\\Deepak Kumar\\Downloads\\myserver.pem")}"
  #   }
  # }

  provisioner "file" {
    source      = "../modules/ec2/install_codedeployagent.sh"
    destination = "/home/ec2-user/install_codedeployagent.sh"

    connection {
      agent       = false
      type        = "ssh"
      user        = "ec2-user"
      host = aws_instance.myserver.public_ip
      # private_key = "${file("C:\\Users\\Deepak Kumar\\Downloads\\myserver.pem")}"
      private_key = "${file("./myserver.pem")}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/install_codedeployagent.sh",
      "/home/ec2-user/install_codedeployagent.sh",
    ]

    connection {
      agent       = false
      type        = "ssh"
      user        = "ec2-user"
      host = aws_instance.myserver.public_ip
      # private_key = "${file("C:\\Users\\Deepak Kumar\\Downloads\\myserver.pem")}"
      private_key = "${file("./myserver.pem")}"
    }


  }

}