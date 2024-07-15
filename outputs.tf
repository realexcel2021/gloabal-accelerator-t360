output "alb_region1" {
  value = module.alb.dns_name
}

output "alb_region2" {
  value = module.alb_secondary.dns_name
}

# output "load_testing_ui" {
#   value = module.alb_load.dns_name
# }

output "cognito_user_pool_id"{
    value = aws_cognito_user_pool.user_pool.id
}

output "cognito_identity_pool_id"{
    value = aws_cognito_identity_pool.main.id
}


output "cognito_web_client_id"{
    value = aws_cognito_user_pool_client.this2.id
}


output "cognito_domain_place_holder"{
    value = "${aws_cognito_user_pool.user_pool.domain}.auth.us-east-1.amazoncognito.com"
}


output "cloudfront_domain" {
  value = aws_cloudfront_distribution.this.domain_name
}