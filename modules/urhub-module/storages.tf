resource "aws_s3_bucket" "urhub-bucket" {
    bucket        = "${var.s3_bucket_name}"
    force_destroy = true
      
    versioning {
          enabled = "${var.s3_enable_versioning}"
        }
    
    lifecycle_rule {
        id      = "${var.s3_lifecycle_id}"
        enabled = "${var.s3_enable_lifecycle}"
        
        prefix = "/"
        
        tags = {
            Name      = "${var.s3_bucket_name}"
            Environment = "${var.env}"
        }

        transition {
            days          = "${var.s3_transition_days}"
            storage_class = "${var.s3_storage_class}"
        }
        
        expiration {
            days = "${var.s3_expiration_days}"
        }
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
                }
        }
    }
    
    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
# }