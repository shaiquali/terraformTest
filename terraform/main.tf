resource "random_integer" "randomint" {
  min     = 1000
  max     = 5000

}

resource "aws_ssm_parameter" "foo" {
  name  = "foo121"
  type  = "String"
  value = "bar12"


 tags = merge(local.customTags)
  # tags = {
  #   "APPID" = "test"
  #   "APPLICATION OWNER" = "hghg"
  #   "APPLICATION NAME" = "dnfgd"
  # }
}

resource "aws_autoscaling_group" "aws_autoscaling_group_1" {
  min_size = 1
  max_size = 4
  tags = [
  {
    key                 = "Foo"
    value               = "Bar"
    propagate_at_launch = true
  },
  {
    key                 = "Baz"
    value               = "Bam"
    propagate_at_launch = true
  }
  ]
}

resource "aws_autoscaling_group" "aws_autoscaling_group_2" {
  min_size = 1
  max_size = 4

  tags = "${local.aws_autoscaling_tags}"
}

resource "aws_autoscaling_group" "aws_autoscaling_group_3" {
  min_size = 1
  max_size = 4

  tags = "${concat(local.aws_autoscaling_tags,
             list(
               tomap({"key"= "Name",
                   "value"= "Tag_sample",
                   "propagate_at_launch"= "false"}),
               tomap({"key"= "Autoscaling",
                   "value"= "True",
                    "propagate_at_launch"= "true"})
              ))}"
}

locals {
  customTags = {
    "APPID" = "test",
    "APPLICATION OWNER" = "hghg",
    "APPLICATION NAME" = "dnfgd"
  }
  aws_autoscaling_tags = [
  {
    key                 = "Foo"
    value               = "Bar"
    propagate_at_launch = true
  },
  {
    key                 = "Baz"
    value               = "Bam"
    propagate_at_launch = true
  }
  ]
}