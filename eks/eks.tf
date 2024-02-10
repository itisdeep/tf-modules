provider "aws" {
    region = var.region
}

data "aws_subnets" "private" {
 tags = {
    Name = "pvt*"
  }
}

data "aws_subnet" "pvt" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}


resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.this.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.this,
    aws_iam_role_policy_attachment.this,
  ]
}