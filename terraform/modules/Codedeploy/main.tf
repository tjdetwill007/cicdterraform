#Creating Codedeploy application

resource "aws_codedeploy_app" "myapplication" {
  compute_platform = "Server"
  name             = "myapplication"
}

#Creating Deployment Group

resource "aws_codedeploy_deployment_group" "myapplicationDeployment" {
  app_name              = aws_codedeploy_app.myapplication.name
  deployment_group_name = "myapplicationDeployment"
  service_role_arn      = var.role_arn
  deployment_config_name = "CodeDeployDefault.AllAtOnce"

   ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = var.getfromec2
    }
  }
  auto_rollback_configuration {
  enabled = false
  events  = ["DEPLOYMENT_FAILURE"]
}
}