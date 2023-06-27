# Lambda Function
output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = module.cloudwatch_log_retention_manager.lambda_function_arn
}

output "lambda_function_arn_static" {
  description = "The static ARN of the Lambda Function. Use this to avoid cycle errors between resources (e.g., Step Functions)"
  value       = module.cloudwatch_log_retention_manager.lambda_function_arn_static
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = module.cloudwatch_log_retention_manager.lambda_function_name
}

# IAM Role
output "lambda_role_arn" {
  description = "The ARN of the IAM role created for the Lambda Function"
  value       = module.cloudwatch_log_retention_manager.lambda_role_arn
}

output "lambda_role_name" {
  description = "The name of the IAM role created for the Lambda Function"
  value       = module.cloudwatch_log_retention_manager.lambda_role_name
}

# CloudWatch Log Group
output "lambda_cloudwatch_log_group_arn" {
  description = "The ARN of the Cloudwatch Log Group"
  value       = module.cloudwatch_log_retention_manager.lambda_cloudwatch_log_group_arn
}

output "lambda_cloudwatch_log_group_name" {
  description = "The name of the Cloudwatch Log Group"
  value       = module.cloudwatch_log_retention_manager.lambda_cloudwatch_log_group_name
}

# EventBridge Schedule
output "eventbridge_schedule_ids" {
  description = "The EventBridge Schedule IDs created"
  value       = module.cloudwatch_log_retention_manager.eventbridge_schedule_ids
}

output "eventbridge_schedule_arns" {
  description = "The EventBridge Schedule ARNs created"
  value       = module.cloudwatch_log_retention_manager.eventbridge_schedule_arns
}
