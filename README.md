# terraform-aws-amplify-lambda-api-dynamodb

## Description
This repository contains Terraform code to provision and manage a serverless AWS infrastructure. The architecture leverages the following AWS services:

- **Amplify**: For hosting the frontend application and managing deployment pipelines.
- **AWS Lambda**: For running serverless backend functions.
- **API Gateway**: To expose RESTful APIs for communication between the frontend and backend.
- **DynamoDB**: As a fully managed NoSQL database solution for scalable and high-performance data storage.

The code is modular and reusable, making it easy to deploy and maintain infrastructure across multiple environments.

---

## Features
- Automated provisioning of Amplify, Lambda, API Gateway, and DynamoDB.
- Environment-specific configurations using variables.
- Integration-ready for CI/CD pipelines and deployment workflows.
- Scalable and secure infrastructure following AWS best practices.

---

## Getting Started
### Prerequisites
- **Terraform**: Version 1.0.0 or later.
- **AWS CLI**: Configured with appropriate credentials.
- AWS account with permissions to create the necessary resources.
