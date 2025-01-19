variable "region" {
  default     = "us-east-1"
  description = "AWS Region"
}


variable "lambda_name" {
  type = string
  default = "collect-info"
}

variable "app_name" {
  type = string
  default = "webapp"
}

variable "lambda_py_file" {
  type = string
  default = "lambda_function.py"

}

variable "db_table_name" {
  type = string
  default = "collect-info"
}

variable "api_gateway_name" {
  type = string
  default = "api-gateway"

}

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "app_repository" {
  description = "GitHub repository URL"
  type        = string
  default   = "https://github.com/ocantov/aws-amplify-webapp-demo"
}

variable "app_repo_branch" {
  description = "Branch to deploy"
  type        = string
  default     = "main"
}
