output "rolearn" {
  value = "${aws_iam_role.CodeDeployRole_terra.arn}"
}

output "roleec2" {
  value = "${aws_iam_instance_profile.instanceprofile.name}"
}