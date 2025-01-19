variable "lambda-name" {
  type = string
  default = "default"
}
 variable "lambda-py-file" {
  type = string
 }
variable "db-table-name" {
  type = string

}
variable "dynamodb-table-arn" {
  type        = string
  description = "The ARN of the DynamoDB table"
}
