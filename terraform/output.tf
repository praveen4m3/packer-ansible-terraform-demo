output "publicIp" {
    value = "${aws_instance.ec2.public_ip}"
}

output "curl" {
    value = "curl http://${aws_instance.ec2.public_ip}"
}

output "example-ami-packer" {
  value = "${data.aws_ami.packer_image.id}"
}
Footer
© 2022 GitHub, Inc.
