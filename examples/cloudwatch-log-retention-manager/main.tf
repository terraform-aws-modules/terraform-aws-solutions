provider "aws" {
  region = local.region

  # Make it faster by skipping something
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

locals {
  name   = "ex-${basename(path.cwd)}"
  region = "eu-west-1"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-solutions"
    GithubOrg  = "terraform-aws-modules"
  }
}

####################################################
# Lambda Function triggered by EventBridge Schedule
####################################################

module "cloudwatch_log_retention_manager" {
  source = "../../modules/cloudwatch-log-retention-manager"

  name = local.name

  # Create package from the source (requires Python)
#  create_package = true

  # Disable creation of the package to use the package distributed in the module
  create_package = false

  environment_variables = {
    RETAIN_DAYS = 90
  }

  schedule_expression = "rate(1 minute)"
  # role_arn = "arn:aws:iam::835367859851:role/my-custom-role"

  tags = local.tags
}
