variable "github-token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "app-repository" {
  description = "GitHub repository URL"
  type        = string
}

variable "app-repo-branch" {
  description = "Branch to deploy"
  type        = string
  default     = "main"
}

variable "app-name" {
  type = string
}
variable "api-gateway-url" {
  type = string
}
