provider "aws" {
  region = "us-east-1"
}

module "urhub-module" {
  source = "./modules/urhub-module"

  cloudtrail_region = "us-east-1"
  cloudtrail_name = "dev-test-trail"
  cloudtrail_enable_logging = true
  cloudtrail_include_global_service_events = false
  cloudtrail_is_multi_region_trail = false
  cloudtrail_enable_log_file_validation = false
  cloudtrail_is_organization_trail = false

  s3_bucket_name = "dev-test-trail-bucket"
  s3_key_prefix = ""
  s3_enable_versioning = true
  s3_lifecycle_id = ""
  s3_enable_lifecycle = true
  s3_transition_days = 90
  s3_storage_class = "ONEZONE_IA"
  s3_expiration_days = 365
  env = "developers"
}