variable "vpc_name" {
  type        = string
  default = "myserverVPC"
  description = "The VPC name."
}

variable "cidrBlock" {
  type        = string
  default = "10.0.0.0/16"
  description = "The VPC name."
}
variable "availabilityzonePublic" {
  type        = string
  default = "us-east-1a"
  description = "The VPC name."
}