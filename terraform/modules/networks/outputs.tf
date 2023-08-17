output "sg" {
    value = "${aws_security_group.mysecuritygp.id}"
  
}
output "subnetid"{
    value = "${aws_subnet.myserverPublicSubnet.id}"
}