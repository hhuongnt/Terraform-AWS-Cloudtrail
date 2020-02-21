**MFA**
- Customer responsibility:
    * Responsible for authentication.
    * Avoid suppression by enable MFA delete.

- How to enable MFA delete:
    * MFA delete can only be done using root AWS Account.
    * First activate MFA on root account following AWS instruction.
    * Create root Access key ID (will be erased after enabling MFA delete) and export to aws environment.
    * Install AWS Cli.
    * Open terminal:
        1. Run list-buckets command to list all buckets name.
            aws s3api list-buckets --query 'Buckets[*].Name'
        2. Run get-bucket-versioning command to see Versioning and MFADelete status
            aws s3api get-bucket-versioning --bucket **bucket-name**
        3. Run put-bucket-versioning command to enable versioning and MFA delete for the selected bucket
            aws s3api put-bucket-versioning --bucket **bucket-name** --versioning-configuration '{"MFADelete":"Enabled","Status":"Enabled"}' --mfa 'arn:aws:iam::**aws_account_id**:mfa/root-account-mfa-device **passcode**'