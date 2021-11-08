provider "aws" {
  version = "~> 3.37"
  region  = "${var.aws_region}"
  #alias = "external-dns-in-commercial"
}
