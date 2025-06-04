variable "authentication" {
  type = object({
    assume_role_arn = string
    region = string
  })

  default = {
    region = "us-west-1"
    assume_role_arn = "arn:aws:iam::123456789012:role/ARN-ROLE-NAME"
  }
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project = "project-name"
  }
}

variable "remote_backend" {
  type = object({
    s3_bucket = object({
      name = string
    })

    dynamodb_table = object({
      name = string
      billing_mode = string
      hash_key = string
    })
  })

  default = {
    s3_bucket = {
      name = "s3_bucket_name"
    }

    dynamodb_table = {
      name = "table_name"
      billing_mode = "PAY_PER_REQUEST"
      hash_key = "LockID"
    }
  }
}