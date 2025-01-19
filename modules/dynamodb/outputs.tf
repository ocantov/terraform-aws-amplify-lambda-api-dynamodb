output "table_arn" {
  value = aws_dynamodb_table.metadata_table.arn
  description = "The ARN of the DynamoDB table"
}
