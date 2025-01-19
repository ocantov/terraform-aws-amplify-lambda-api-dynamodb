provider "aws" {
  region = var.region # Specify your AWS region
}


module "lambda" {
  source              = "./modules/lambda"
  lambda-name         = "${var.app_name}-${var.lambda_name}"
  lambda-py-file      = "${var.lambda_py_file}"
  db-table-name       = "${var.app_name}-${var.db_table_name}"
  dynamodb-table-arn  = module.dynamodb.table_arn # Pass the ARN as an input
}

module "dynamodb" {
  source          = "./modules/dynamodb"
  db-table-name         = "${var.app_name}-${var.db_table_name}"
}

module "api_gateway" {
  source                = "./modules/api_gateway"
  api-gateway-name      = "${var.app_name}-${var.api_gateway_name}"
  api-gateway-resource  = "${var.app_name}"
  lambda-arn            = module.lambda.lambda-arn
  region                = var.region
}

module "amplify" {
  source                = "./modules/amplify"
  app-name              = "${var.app_name}"
  app-repo-branch       = "${var.app_repo_branch}"
  app-repository        = "${var.app_repository}"
  github-token          = "${var.github_token}"
  api-gateway-url       = module.api_gateway.api-gateway-url
}
