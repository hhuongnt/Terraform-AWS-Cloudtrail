variable "cloudtrail_region" {
  default = "us-east-1"
  description = "Name of the region where the Trail should be created."
}
variable "cloudtrail_name" {
    description = "Name of cloudtrail."
    default = "urnhub-cloudtrail"
}

variable "cloudtrail_enable_logging" {
    default = "true"
}

variable "cloudtrail_include_global_service_events" {
    default = "false"
}

variable "cloudtrail_is_multi_region_trail" {
    default = "false"
}

variable "cloudtrail_enable_log_file_validation" {
    default = "false"
}

variable "cloudtrail_is_organization_trail" {
    default = "false"
}

variable "s3_bucket_name" {
    description = "Name of S3 bucket stores trail logs."
    default = "urhub-bucket"
}

variable "s3_key_prefix" {
    default = ""
}

variable "s3_enable_versioning" {
    default = "true"
}

variable "s3_lifecycle_id" {
    default = "log"
}

variable "s3_enable_lifecycle" {
    default = "true"
}

variable "s3_transition_days" {
    default = "90"
}

variable "s3_storage_class" {
    default = "STANDARD_IA"
}

variable "s3_expiration_days" {
    default = "365"
}

variable "env" {
    default = "master"
}




