output "instancename" {
  value=aws_instance.myserver.tags.Name
}