locals {
  create = var.create && var.putin_khuylo
}

##################
# Lambda Function
##################
module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 5.0"

  create = local.create

  function_name = var.name
  description   = var.description
  handler       = "log_retention_manager.lambda_handler"
  runtime       = "python3.10"
  publish       = true

  memory_size           = var.memory_size
  timeout               = var.timeout
  environment_variables = var.environment_variables

  cloudwatch_logs_retention_in_days = var.cloudwatch_logs_retention_in_days

  create_package = var.create_package
  source_path    = var.source_path != null ? var.source_path : "${path.module}/src/log_retention_manager.py"

  local_existing_package = var.create_package ? null : "${path.module}/dist/log_retention_manager.zip"

  attach_policy_statements = true
  policy_statements = {
    readonly = {
      effect = "Allow"
      actions = [
        "ec2:DescribeRegions",
        "logs:DescribeLogGroups"
      ]
      resources = ["*"]
    },
    logs_retention_policy = {
      effect    = "Allow",
      actions   = ["logs:PutRetentionPolicy"],
      resources = ["*"]
    }
  }

  create_current_version_allowed_triggers = false
  allowed_triggers = {
    scheduled = {
      principal  = "scheduler.amazonaws.com"
      source_arn = module.eventbridge.eventbridge_schedule_arns["lambda-${var.name}"]
    }
  }

  tags = merge(var.tags, var.lambda_tags)
}

########################
# EventBridge Schedules
########################
module "eventbridge" {
  source  = "terraform-aws-modules/eventbridge/aws"
  version = "~> 2.3"

  create = local.create

  create_bus  = false
  create_role = var.role_arn == null

  role_name = var.eventbridge_role_name

  attach_lambda_policy = true
  lambda_target_arns   = [module.lambda_function.lambda_function_arn]

  schedules = {
    "lambda-${var.name}" = {
      description         = "Trigger Lambda ${var.name}"
      schedule_expression = var.schedule_expression
      arn                 = module.lambda_function.lambda_function_arn
      role_arn            = var.role_arn
    }
  }

  tags = merge(var.tags, var.eventbridge_tags)
}
