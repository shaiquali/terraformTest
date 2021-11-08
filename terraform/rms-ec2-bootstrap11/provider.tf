provider "aws" {
  version = "~> v2.70.0"
  region  = "${var.aws_region}"
  #alias = "external-dns-in-commercial"
}
