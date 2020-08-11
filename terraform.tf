terraform {
  backend "s3" {
    region  = "me-south-1"
    encrypt = true
    bucket         = "the-sun-must-die"
    key            = "moon/tiny-infra/terraform.tfstate"
    dynamodb_table = "the-moon-has-never-been-there"
  }
}
