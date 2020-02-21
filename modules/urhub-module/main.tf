provider "aws" {
    region="${var.cloudtrail_region}"
}

resource "aws_cloudtrail" "urhub-cloudtrail" {
    name                            = "${var.cloudtrail_name}"
    s3_bucket_name                  = "${aws_s3_bucket.urhub-bucket.id}"
    s3_key_prefix                   = "${var.s3_key_prefix}"

    enable_logging                  = "${var.cloudtrail_enable_logging}"
    include_global_service_events   = "${var.cloudtrail_include_global_service_events}"
    is_multi_region_trail           = "${var.cloudtrail_is_multi_region_trail}"
    enable_log_file_validation      = "${var.cloudtrail_enable_log_file_validation}"
    is_organization_trail           = "${var.cloudtrail_is_organization_trail}"

    tags = {
        Name = "${var.cloudtrail_name}"
        Environment = "${var.env}"
    }
    }