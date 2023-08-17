data "aws_iam_policy" "codeDeploy" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}
data "aws_iam_policy" "codeDeploy2" {
  arn= "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

data "aws_iam_policy" "Ec2instancepolicy" {
  arn= "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
}