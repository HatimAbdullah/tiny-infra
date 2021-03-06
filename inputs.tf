variable "public_key_path" {
  description = "path to public key to inject into the instances to allow ssh"
  default     = "./ssh/id_rsa.pub"
}

variable "key_name" {
  description = "master key for the lab"
  default     = "fish-key"
}

variable "name" {
  default = "fish"
  description = "A name to be applied to make everything unique and personal"
}

variable "instance_type" {
  default = "t3.micro"
}
