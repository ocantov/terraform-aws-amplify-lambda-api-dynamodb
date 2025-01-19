# Create DynamoDB Table
resource "aws_dynamodb_table" "metadata_table" {
  name           = "${var.db-table-name}"
  billing_mode   = "PAY_PER_REQUEST" # Use on-demand billing
  hash_key       = "id"             # Partition key

  attribute {
    name = "id"
    type = "S" # String type
  }

  # Enable point-in-time recovery (optional, for data safety)
  point_in_time_recovery {
    enabled = true
  }

  # Tags for the table
  tags = {
    Environment = "Development"
    Application = "MetadataStorage"
  }
}
