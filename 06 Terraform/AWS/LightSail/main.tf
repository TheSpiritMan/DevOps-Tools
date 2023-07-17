provider "aws" {
  profile = var.aws_profile
  # access_key = var.access_key
  # secret_key = var.secret_key
  region = "ap-south-1"
}

resource "aws_lightsail_instance" "test-instance" {
  name              = "test-instance"
  availability_zone = "ap-south-1a"
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "nano_3_1"
  key_pair_name     = "id_rsa"
  user_data         = <<-EOF
    #!/bin/bash
    echo "Setting hostname..."
    hostnamectl set-hostname test-instance
    EOF

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = self.public_ip_address
      user        = "ubuntu"
      private_key = file(var.privKey)
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get install docker.io docker-compose nginx certbot python3-certbot-nginx -y",
    ]
  }
}

resource "aws_lightsail_static_ip" "test-instance-ip" {
  name = "test-instance-ip"
}

resource "aws_lightsail_static_ip_attachment" "test" {
  static_ip_name = aws_lightsail_static_ip.test-instance-ip.name
  instance_name  = aws_lightsail_instance.test-instance.name
}

output "instance_details" {
  value = {
    public_ip     = aws_lightsail_instance.test-instance.public_ip_address
    staic_ip      = aws_lightsail_static_ip.test-instance-ip.ip_address
    username      = aws_lightsail_instance.test-instance.username
    instance_name = aws_lightsail_instance.test-instance.name
  }
}
