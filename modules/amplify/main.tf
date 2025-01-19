resource "aws_iam_role" "amplify_service_role" {
  name = "amplify-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "amplify.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "amplify_service_policy" {
  name = "amplify-service-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["*"],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "amplify_policy_attachment" {
  role       = aws_iam_role.amplify_service_role.name
  policy_arn = aws_iam_policy.amplify_service_policy.arn
}


resource "aws_amplify_app" "amplify_app" {
  name               = "my-amplify-app"
  repository         = var.app-repository
  oauth_token        = var.github-token
  platform           = "WEB"
  iam_service_role_arn = aws_iam_role.amplify_service_role.arn

environment_variables = {
    REACT_APP_API_ENDPOINT  = var.api-gateway-url
  }

  build_spec = <<EOT
version: 1.0
frontend:
  phases:
    preBuild:
      commands:
        - npm install
    build:
      commands:
        - echo "REACT_APP_API_ENDPOINT=$REACT_APP_API_ENDPOINT" >> .env
        - npm run build
  artifacts:
    baseDirectory: build
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*

EOT
}


resource "aws_amplify_branch" "main_branch" {
  app_id            =  aws_amplify_app.amplify_app.id
  branch_name       = "${var.app-repo-branch}"

  environment_variables = {
    NODE_ENV = "dev"
  }
  enable_auto_build = true
}
