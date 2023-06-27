variable "create" {
  description = "Controls whether to create resources"
  type        = bool
  default     = true
}

variable "create_package" {
  description = "Whether to create Lambda function package (requires Python)"
  type        = string
  default     = false
}

# Tags
variable "tags" {
  description = "A map of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "lambda_tags" {
  description = "A map of tags to assign to all resources created by Lambda module"
  type        = map(string)
  default     = {}
}

variable "eventbridge_tags" {
  description = "A map of tags to assign to all resources created by EventBridge module"
  type        = map(string)
  default     = {}
}

# Lambda
variable "name" {
  description = "Lambda function name"
  type        = string
  default     = "cloudwatch-log-retention-manager"
}

variable "description" {
  description = "Description of Lambda function"
  type        = string
  default     = "CloudWatch Log Retention Manager"
}

variable "source_path" {
  description = "Source path object with instructions on how to build Lambda function package"
  type        = any
  default     = null
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 10,240 MB (10 GB), in 64 MB increments."
  type        = number
  default     = 256
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 30
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "cloudwatch_logs_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653."
  type        = number
  default     = 90
}

# EventBridge
variable "eventbridge_role_name" {
  description = "Name of EventBridge IAM role to create"
  type        = string
  default     = null
}

variable "schedule_expression" {
  description = "Schedule expression for EventBridge to trigger Lambda function. Can be cron() or rate()."
  type        = string
  default     = "rate(12 hours)"
}

variable "role_arn" {
  description = "ARN of IAM Role used by EventBridge to invoke Lambda Function"
  type        = string
  default     = null
}

variable "putin_khuylo" {
  description = "Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!"
  type        = bool
  default     = true
}
