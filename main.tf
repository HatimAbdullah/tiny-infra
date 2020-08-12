provider "aws" {
  profile = "default"
  region  = "me-south-1"
}

module "dev" {
  name            = "fish"
  source          = "./lab"
  key_name        = var.key_name
  instance_type   = var.instance_type
}

