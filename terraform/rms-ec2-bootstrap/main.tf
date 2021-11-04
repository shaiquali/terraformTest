resource "random_integer" "randomint" {
  min     = 1000
  max     = 5000

}

resource "aws_ssm_parameter" "foo" {
  name  = "foo121"
  type  = "String"
  value = "bar12"

  tags = {
    "APPID" = "test"
    "APPLICATION OWNER" = "hghg"
    "APPLICATION NAME" = "dnfgd"
  }
}


# locals {
#   customTags = {
#     "APPID" = "test",
#     "APPLICATION OWNER" = "hghg",
#     "APPLICATION NAME" = "dnfgd"
#   }
# }