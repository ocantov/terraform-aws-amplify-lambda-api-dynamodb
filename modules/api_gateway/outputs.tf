output "api-gateway-url" {
  value       = "${aws_api_gateway_stage.api_stage.invoke_url}/${var.api-gateway-resource}"
  description = "The base URL of the API Gateway"
}
# Outputs for the API
output "api_invoke_url" {
  value = aws_api_gateway_deployment.api_deployment.invoke_url
  description = "The invoke URL of the API Gateway"
}
