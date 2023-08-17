
#Creating Role for CodeDeploy

resource "aws_iam_role" "CodeDeployRole_terra" {
  name = "CodeDeployRole_terra"
  description = "Allow CodeDeploy to access s3."
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "codedeploy.amazonaws.com"
                ]
            },
            "Action": [
                "sts:AssumeRole"
            ]
        }
    ]
})
  tags = {
    Name = "CodeDeployRole_terra"
  }
}

#Attaching Policy to CodeDeploy role

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.CodeDeployRole_terra.name
  policy_arn = data.aws_iam_policy.codeDeploy.arn
}

resource "aws_iam_role_policy_attachment" "test-attach2" {
  role       = aws_iam_role.CodeDeployRole_terra.name
  policy_arn = data.aws_iam_policy.codeDeploy2.arn
}

# Creating Role for ec2 Instance.

resource "aws_iam_role" "Ec2InstanceCodeDeploy" {
  name = "Ec2InstanceCodeDeploy"
  description = "Allow for Ec2 instance in CodeDeploy."
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})
  tags = {
    Name = "Ec2InstanceCodeDeploy"
  }
}

#Instance profile

resource "aws_iam_instance_profile" "instanceprofile" {
  name = "${aws_iam_role.Ec2InstanceCodeDeploy.name}"
  role = "${aws_iam_role.Ec2InstanceCodeDeploy.name}"
}

# Attaching policy for the ec2 Instance.
resource "aws_iam_role_policy_attachment" "test-attach3" {
  role       = aws_iam_role.Ec2InstanceCodeDeploy.name
  policy_arn = data.aws_iam_policy.Ec2instancepolicy.arn
}

