resource "aws_api_gateway_rest_api" "my_api_sec" {
  name = "t360-rest-api"
  description = "rest api"
    provider = aws.region2

  endpoint_configuration {
    types = ["PRIVATE"]
    vpc_endpoint_ids = [module.endpoints_secondary.endpoints["api_gateway"].id]
  }
}

resource "aws_api_gateway_rest_api_policy" "this_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  policy      = data.aws_iam_policy_document.apigateway_access.json
}


resource "aws_api_gateway_deployment" "this_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
    provider = aws.region2

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_authorizer.demo_sec,
      aws_api_gateway_authorizer.demo_sec,
        aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec_options,
        aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec,
        aws_api_gateway_integration.ApiGatewayMethodCreateremittanceTable_sec,
        aws_api_gateway_integration.ApiGatewayMethodCreateremittanceTable_sec_options,

        aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec_options,
        aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec,
        aws_api_gateway_integration.ApiGatewayMethodDropremittanceTable_sec,
        aws_api_gateway_integration.ApiGatewayMethodDropremittanceTable_sec_options,

        aws_api_gateway_method.ApiGatewayMethodGetremittances_sec,
        aws_api_gateway_method.ApiGatewayMethodGetremittances_sec_options,
        aws_api_gateway_integration.ApiGatewayMethodGetremittances_sec_options,
        aws_api_gateway_integration.ApiGatewayMethodGetremittances_sec,


        aws_api_gateway_method.ResourceCreateremittance_sec,
        aws_api_gateway_method.ResourceCreateremittance_sec_options,
        aws_api_gateway_integration.ResourceCreateremittance_sec,
        aws_api_gateway_integration.ResourceCreateremittance_sec_options,


        aws_api_gateway_method.ResourceUpdateremittance_sec,
        aws_api_gateway_method.ResourceUpdateremittance_sec_options,
        aws_api_gateway_integration.ResourceUpdateremittance_sec,
        aws_api_gateway_integration.ResourceUpdateremittance_sec_options,

        aws_api_gateway_method.ResourceDeleteremittance_sec,
        aws_api_gateway_method.ResourceDeleteremittance_sec_options,
        aws_api_gateway_integration.ResourceDeleteremittance_sec,
        aws_api_gateway_integration.ResourceDeleteremittance_sec_options,

        aws_api_gateway_method.ResourceClearremittances_sec,
        aws_api_gateway_method.ResourceClearremittances_sec_options,
        aws_api_gateway_integration.ResourceClearremittances_sec,
        aws_api_gateway_integration.ResourceClearremittances_sec_options,

      aws_api_gateway_resource.demo_sec,
      aws_api_gateway_integration.demo_sec,
      aws_api_gateway_rest_api_policy.this_sec,

      aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec,
      aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodCreateRevenueTable_sec,
      aws_api_gateway_integration.ApiGatewayMethodCreateRevenueTable_sec_options,

      aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec,
      aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodCreateRevenueItem_sec,
      aws_api_gateway_integration.ApiGatewayMethodCreateRevenueItem_sec_options,

      aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec,
      aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodGetRevenueItem_sec,
      aws_api_gateway_integration.ApiGatewayMethodGetRevenueItem_sec_options,

      aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec,
      aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodUploadImagePublic_sec,
      aws_api_gateway_integration.ApiGatewayMethodUploadImagePublic_sec_options,

      aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec,
      aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodUploadImagePrivate_sec,
      aws_api_gateway_integration.ApiGatewayMethodUploadImagePrivate_sec_options,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [ 
        aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec_options,
        aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec,
        aws_api_gateway_integration.ApiGatewayMethodCreateremittanceTable_sec,
        aws_api_gateway_integration.ApiGatewayMethodCreateremittanceTable_sec_options,

        aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec_options,
        aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec,
        aws_api_gateway_integration.ApiGatewayMethodDropremittanceTable_sec,
        aws_api_gateway_integration.ApiGatewayMethodDropremittanceTable_sec_options,

        aws_api_gateway_method.ApiGatewayMethodGetremittances_sec,
        aws_api_gateway_method.ApiGatewayMethodGetremittances_sec_options,
        aws_api_gateway_integration.ApiGatewayMethodGetremittances_sec_options,
        aws_api_gateway_integration.ApiGatewayMethodGetremittances_sec,


        aws_api_gateway_method.ResourceCreateremittance_sec,
        aws_api_gateway_method.ResourceCreateremittance_sec_options,
        aws_api_gateway_integration.ResourceCreateremittance_sec,
        aws_api_gateway_integration.ResourceCreateremittance_sec_options,


        aws_api_gateway_method.ResourceUpdateremittance_sec,
        aws_api_gateway_method.ResourceUpdateremittance_sec_options,
        aws_api_gateway_integration.ResourceUpdateremittance_sec,
        aws_api_gateway_integration.ResourceUpdateremittance_sec_options,

        aws_api_gateway_method.ResourceDeleteremittance_sec,
        aws_api_gateway_method.ResourceDeleteremittance_sec_options,
        aws_api_gateway_integration.ResourceDeleteremittance_sec,
        aws_api_gateway_integration.ResourceDeleteremittance_sec_options,

        aws_api_gateway_method.ResourceClearremittances_sec,
        aws_api_gateway_method.ResourceClearremittances_sec_options,
        aws_api_gateway_integration.ResourceClearremittances_sec,
        aws_api_gateway_integration.ResourceClearremittances_sec_options,

      aws_api_gateway_resource.demo_sec,
      aws_api_gateway_integration.demo_sec,
      aws_api_gateway_rest_api_policy.this_sec,

      aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec,
      aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodCreateRevenueTable_sec,
      aws_api_gateway_integration.ApiGatewayMethodCreateRevenueTable_sec_options,

      aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec,
      aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodCreateRevenueItem_sec,
      aws_api_gateway_integration.ApiGatewayMethodCreateRevenueItem_sec_options,

      aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec,
      aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodGetRevenueItem_sec,
      aws_api_gateway_integration.ApiGatewayMethodGetRevenueItem_sec_options,

      aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec,
      aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodUploadImagePublic_sec,
      aws_api_gateway_integration.ApiGatewayMethodUploadImagePublic_sec_options,

      aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec,
      aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec_options,
      aws_api_gateway_integration.ApiGatewayMethodUploadImagePrivate_sec,
      aws_api_gateway_integration.ApiGatewayMethodUploadImagePrivate_sec_options,


    ]
}


resource "aws_api_gateway_stage" "this_sec" {
  deployment_id = aws_api_gateway_deployment.this_sec.id
  rest_api_id   = aws_api_gateway_rest_api.my_api_sec.id
  stage_name    = "dev"
    provider = aws.region2
}


resource "aws_api_gateway_authorizer" "demo_sec" {
  name                   = "CognitoAuthorizer"
  rest_api_id            = aws_api_gateway_rest_api.my_api_sec.id
  identity_source        = "method.request.header.authorization"
  type                   = "COGNITO_USER_POOLS"
  provider_arns          = [ "${aws_cognito_user_pool.user_pool.arn}" ]  
    provider = aws.region2
}

resource "aws_api_gateway_domain_name" "this_sec" {
  regional_certificate_arn = module.acm.acm_certificate_arn
  domain_name     = "${var.domain_name}"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
    provider = aws.region2
}


resource "aws_api_gateway_base_path_mapping" "this_sec" {
  api_id      = aws_api_gateway_rest_api.my_api_sec.id
  stage_name  = aws_api_gateway_stage.this_sec.stage_name
  domain_name = aws_api_gateway_domain_name.this_sec.domain_name

  depends_on = [ aws_api_gateway_deployment.this_sec ]
    provider = aws.region2
}


##########################################
# Get region method
##########################################

resource "aws_api_gateway_resource" "demo_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "get-region"
    provider = aws.region2
}

resource "aws_api_gateway_method" "demo_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.demo_sec.id
  http_method = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo_sec.id
    provider = aws.region2
}

resource "aws_api_gateway_integration" "demo_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.demo_sec.id
  http_method = aws_api_gateway_method.demo_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.lambda_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
    provider = aws.region2
}

resource "aws_api_gateway_method_response" "demo_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.demo_sec.id
  http_method = aws_api_gateway_method.demo_sec.http_method
  status_code = "200"
    provider = aws.region2

  //cors section
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin" = true
  }

}

resource "aws_api_gateway_integration_response" "demo_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.demo_sec.id
  http_method = aws_api_gateway_method.demo_sec.http_method
  status_code = aws_api_gateway_method_response.demo_sec.status_code
    provider = aws.region2


  //cors
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
}

  depends_on = [
    aws_api_gateway_method.demo_sec,
    aws_api_gateway_integration.demo_sec
  ]
}


############################################
# create remittance 
############################################

resource "aws_api_gateway_resource" "ApiGatewayMethodCreateremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "create-remittance-table"
    provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodCreateremittanceTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateremittanceTable_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
    provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodCreateremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateremittanceTable_sec.id
  http_method = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo_sec.id
    provider = aws.region2
}

resource "aws_api_gateway_method_settings" "this_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  stage_name  = aws_api_gateway_stage.this_sec.stage_name
  method_path = "*/*"
    provider = aws.region2

  settings {
    metrics_enabled = false
    logging_level   = "OFF"
  }
}

resource "aws_api_gateway_integration" "ApiGatewayMethodCreateremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
    provider = aws.region2
  uri = "${module.CreateRemittanceTableLambdaFunction_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
}

resource "aws_api_gateway_integration" "ApiGatewayMethodCreateremittanceTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
    provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodCreateremittanceTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec_options.http_method
  status_code = "200"
    provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodCreateremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec.http_method
  status_code = "200"
    provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "get-cluster-info_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec_options.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodCreateremittanceTable_sec_options.status_code
    provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec,
    aws_api_gateway_integration.ApiGatewayMethodCreateremittanceTable_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = null
  }
}

resource "aws_api_gateway_integration_response" "get-cluster-info_sec_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodCreateremittanceTable_sec.status_code
    provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodCreateremittanceTable_sec,
    aws_api_gateway_integration.ApiGatewayMethodCreateremittanceTable_sec
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'",
  }

  response_templates = {
    "application/json" = null
  }
}



############################################
# Drop remittance 
############################################

resource "aws_api_gateway_resource" "ApiGatewayMethodDropremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "drop-remittance-table"
    provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodDropremittanceTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodDropremittanceTable_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
      provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodDropremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodDropremittanceTable_sec.id
  http_method = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo_sec.id
      provider = aws.region2
}

resource "aws_api_gateway_method_settings" "ApiGatewayMethodDropremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  stage_name  = aws_api_gateway_stage.this_sec.stage_name
  method_path = "*/*"
      provider = aws.region2

  settings {
    metrics_enabled = false
    logging_level   = "OFF"
  }
}

resource "aws_api_gateway_integration" "ApiGatewayMethodDropremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodDropremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.DropRemittanceTableLambdaFunction_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
      provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodDropremittanceTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodDropremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
      provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodDropremittanceTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodDropremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec_options.http_method
  status_code = "200"
      provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodDropremittanceTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodDropremittanceTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec_options.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodDropremittanceTable_sec_options.status_code
      provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodDropremittanceTable_sec,
    aws_api_gateway_integration.ApiGatewayMethodDropremittanceTable_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = null
  }
}


############################################
# Get remittance 
############################################

resource "aws_api_gateway_resource" "ApiGatewayMethodGetremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "get-remittances"
      provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodGetremittances_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetremittances_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
  api_key_required = false
      provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodGetremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetremittances_sec.id
  http_method = "GET"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo_sec.id
      provider = aws.region2
}

resource "aws_api_gateway_method_settings" "ApiGatewayMethodGetremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  stage_name  = aws_api_gateway_stage.this_sec.stage_name
  method_path = "*/*"
      provider = aws.region2

  settings {
    metrics_enabled = false
    logging_level   = "OFF"
  }
}

resource "aws_api_gateway_integration" "ApiGatewayMethodGetremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetremittances_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetremittances_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.GetRemittancesLambdaFunction_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
      provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodGetremittances_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetremittances_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetremittances_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
      provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodGetremittances_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetremittances_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetremittances_sec_options.http_method
  status_code = "200"
      provider = aws.region2
  

  response_models = {
    "application/json" = "Empty"
  }


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false,
  }
}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodGetremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetremittances_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetremittances_sec_options.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodGetremittances_sec_options.status_code
      provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodGetremittances_sec,
    aws_api_gateway_integration.ApiGatewayMethodGetremittances_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = null
  }
}





############################################
# Create remittance 
############################################

resource "aws_api_gateway_resource" "ResourceCreateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "create-remittance"
      provider = aws.region2
}

resource "aws_api_gateway_method" "ResourceCreateremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceCreateremittance_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
      provider = aws.region2
}

resource "aws_api_gateway_method" "ResourceCreateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceCreateremittance_sec.id
  http_method = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo_sec.id
      provider = aws.region2
}

resource "aws_api_gateway_method_settings" "ResourceCreateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  stage_name  = aws_api_gateway_stage.this_sec.stage_name
  method_path = "*/*"
      provider = aws.region2

  settings {
    metrics_enabled = false
    logging_level   = "OFF"
  }
}

resource "aws_api_gateway_integration" "ResourceCreateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceCreateremittance_sec.id
  http_method = aws_api_gateway_method.ResourceCreateremittance_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.CreateRemittanceLambdaFunction_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
      provider = aws.region2
}

resource "aws_api_gateway_integration" "ResourceCreateremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceCreateremittance_sec.id
  http_method = aws_api_gateway_method.ResourceCreateremittance_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
      provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ResourceCreateremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceCreateremittance_sec.id
  http_method = aws_api_gateway_method.ResourceCreateremittance_sec_options.http_method
  status_code = "200"
      provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ResourceCreateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceCreateremittance_sec.id
  http_method = aws_api_gateway_method.ResourceCreateremittance_sec_options.http_method
  status_code = aws_api_gateway_method_response.ResourceCreateremittance_sec_options.status_code
      provider = aws.region2
  

  depends_on = [
    aws_api_gateway_method.ResourceCreateremittance_sec,
    aws_api_gateway_integration.ResourceCreateremittance_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = null
  }
}




############################################
# Update remittance 
############################################

resource "aws_api_gateway_resource" "ResourceUpdateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "update-remittance"
      provider = aws.region2
}

resource "aws_api_gateway_method" "ResourceUpdateremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceUpdateremittance_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
      provider = aws.region2
}

resource "aws_api_gateway_method" "ResourceUpdateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceUpdateremittance_sec.id
  http_method = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo_sec.id
      provider = aws.region2
}

resource "aws_api_gateway_method_settings" "ResourceUpdateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  stage_name  = aws_api_gateway_stage.this_sec.stage_name
  method_path = "*/*"
      provider = aws.region2
  

  settings {
    metrics_enabled = false
    logging_level   = "OFF"
  }
}

resource "aws_api_gateway_integration" "ResourceUpdateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceUpdateremittance_sec.id
  http_method = aws_api_gateway_method.ResourceUpdateremittance_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.UpdateRemittanceLambdaFunction_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ResourceUpdateremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceUpdateremittance_sec.id
  http_method = aws_api_gateway_method.ResourceUpdateremittance_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
        provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ResourceUpdateremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceUpdateremittance_sec.id
  http_method = aws_api_gateway_method.ResourceUpdateremittance_sec_options.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ResourceUpdateremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceUpdateremittance_sec.id
  http_method = aws_api_gateway_method.ResourceUpdateremittance_sec_options.http_method
  status_code = aws_api_gateway_method_response.ResourceUpdateremittance_sec_options.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ResourceUpdateremittance_sec,
    aws_api_gateway_integration.ResourceUpdateremittance_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = null
  }
}



############################################
# Delete remittance 
############################################

resource "aws_api_gateway_resource" "ResourceDeleteremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "delete-remittance"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ResourceDeleteremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceDeleteremittance_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ResourceDeleteremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceDeleteremittance_sec.id
  http_method = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo_sec.id
        provider = aws.region2
}

resource "aws_api_gateway_method_settings" "ResourceDeleteremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  stage_name  = aws_api_gateway_stage.this_sec.stage_name
  method_path = "*/*"
        provider = aws.region2

  settings {
    metrics_enabled = false
    logging_level   = "OFF"
  }
}

resource "aws_api_gateway_integration" "ResourceDeleteremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceDeleteremittance_sec.id
  http_method = aws_api_gateway_method.ResourceDeleteremittance_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.DeleteRemittanceLambdaFunction_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ResourceDeleteremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceDeleteremittance_sec.id
  http_method = aws_api_gateway_method.ResourceDeleteremittance_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
        provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ResourceDeleteremittance_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceDeleteremittance_sec.id
  http_method = aws_api_gateway_method.ResourceDeleteremittance_sec_options.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ResourceDeleteremittance_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceDeleteremittance_sec.id
  http_method = aws_api_gateway_method.ResourceDeleteremittance_sec_options.http_method
  status_code = aws_api_gateway_method_response.ResourceDeleteremittance_sec_options.status_code
        provider = aws.region2
  

  depends_on = [
    aws_api_gateway_method.ResourceDeleteremittance_sec,
    aws_api_gateway_integration.ResourceDeleteremittance_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = null
  }
}


############################################
# Clear remittance 
############################################

resource "aws_api_gateway_resource" "ResourceClearremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "clear-remittances"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ResourceClearremittances_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceClearremittances_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ResourceClearremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceClearremittances_sec.id
  http_method = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo_sec.id
        provider = aws.region2
}

resource "aws_api_gateway_method_settings" "ResourceClearremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  stage_name  = aws_api_gateway_stage.this_sec.stage_name
  method_path = "*/*"
        provider = aws.region2

  settings {
    metrics_enabled = false
    logging_level   = "OFF"
  }
}

resource "aws_api_gateway_integration" "ResourceClearremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceClearremittances_sec.id
  http_method = aws_api_gateway_method.ResourceClearremittances_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.ClearRemittancesLambdaFunction_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ResourceClearremittances_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceClearremittances_sec.id
  http_method = aws_api_gateway_method.ResourceClearremittances_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
        provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ResourceClearremittances_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceClearremittances_sec.id
  http_method = aws_api_gateway_method.ResourceClearremittances_sec_options.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ResourceClearremittances_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ResourceClearremittances_sec.id
  http_method = aws_api_gateway_method.ResourceClearremittances_sec_options.http_method
  status_code = aws_api_gateway_method_response.ResourceClearremittances_sec_options.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ResourceClearremittances_sec,
    aws_api_gateway_integration.ResourceClearremittances_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = null
  }
}


##########################################
# create revenue table method
##########################################

resource "aws_api_gateway_resource" "ApiGatewayMethodCreateRevenueTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "create-revenue-table"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodCreateRevenueTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueTable_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodCreateRevenueTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueTable_sec.id
  http_method = "POST"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodCreateRevenueTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.Create_Revenue_Table_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodCreateRevenueTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
        provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodCreateRevenueTable_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec_options.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodCreateRevenueTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodCreateRevenueTable_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec_options.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodCreateRevenueTable_sec_options.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec,
    aws_api_gateway_integration.ApiGatewayMethodCreateRevenueTable_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodCreateRevenueTable_sec_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueTable_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodCreateRevenueTable_sec.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodCreateRevenueTable_sec,
    aws_api_gateway_integration.ApiGatewayMethodCreateRevenueTable_sec
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'",
  }
}




##########################################
# create revenue item method
##########################################

resource "aws_api_gateway_resource" "ApiGatewayMethodCreateRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "create-revenue-item"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodCreateRevenueItem_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueItem_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodCreateRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueItem_sec.id
  http_method = "POST"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodCreateRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri  = "arn:aws:apigateway:${var.region1}:events:action/PutEvents" 
  passthrough_behavior = "WHEN_NO_TEMPLATES"
        provider = aws.region2
  credentials = module.apigateway_put_events_to_eventbridge_role.iam_role_arn


  request_templates = {
        "application/json" = <<-EOT
            #set($context.requestOverride.header.X-Amz-Target = "AWSEvents.PutEvents")
            #set($context.requestOverride.header.Content-Type = "application/x-amz-json-1.1")            
            #set($inputRoot = $input.json('$')) 
          {
            "Entries": [
              {
                "Detail": "$util.escapeJavaScript($inputRoot).replaceAll("\\'","'")",
                "DetailType": "Order Create", 
                "EventBusName": "${module.eventbridge_secondary.eventbridge_bus_name}", 
                "Source": "api.gateway.ca.create" 
              }
            ]
          }
        EOT
  }
}

resource "aws_api_gateway_integration" "ApiGatewayMethodCreateRevenueItem_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
        provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodCreateRevenueItem_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec_options.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodCreateRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodCreateRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec_options.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodCreateRevenueItem_sec_options.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec,
    aws_api_gateway_integration.ApiGatewayMethodCreateRevenueItem_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodCreateRevenueItem_sec_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodCreateRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodCreateRevenueItem_sec.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodCreateRevenueItem_sec,
    aws_api_gateway_integration.ApiGatewayMethodCreateRevenueItem_sec
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'",
  }
}


##########################################
# get revenue item method
##########################################

resource "aws_api_gateway_resource" "ApiGatewayMethodGetRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "get-revenue-item"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodGetRevenueItem_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetRevenueItem_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodGetRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetRevenueItem_sec.id
  http_method = "GET"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodGetRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.Get_Revenue_Item_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodGetRevenueItem_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
        provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodGetRevenueItem_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec_options.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodGetRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodGetRevenueItem_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec_options.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodGetRevenueItem_sec_options.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec,
    aws_api_gateway_integration.ApiGatewayMethodGetRevenueItem_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodGetRevenueItem_sec_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodGetRevenueItem_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodGetRevenueItem_sec.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodGetRevenueItem_sec,
    aws_api_gateway_integration.ApiGatewayMethodGetRevenueItem_sec
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'",
  }
}


##########################################
# Upload public Image to s3
##########################################

resource "aws_api_gateway_resource" "ApiGatewayMethodUploadImagePublic_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "upload-image-public"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodUploadImagePublic_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePublic_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodUploadImagePublic_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePublic_sec.id
  http_method = "POST"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodUploadImagePublic_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePublic_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.Image_Uploader_public_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodUploadImagePublic_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePublic_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
        provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodUploadImagePublic_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePublic_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec_options.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodUploadImagePublic_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePublic_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodUploadImagePublic_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePublic_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec_options.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodUploadImagePublic_sec_options.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec,
    aws_api_gateway_integration.ApiGatewayMethodUploadImagePublic_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodUploadImagePublic_sec_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePublic_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodUploadImagePublic_sec.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodUploadImagePublic_sec,
    aws_api_gateway_integration.ApiGatewayMethodUploadImagePublic_sec
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'",
  }
}



##########################################
# Upload private Image to s3
##########################################

resource "aws_api_gateway_resource" "ApiGatewayMethodUploadImagePrivate_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  parent_id = aws_api_gateway_rest_api.my_api_sec.root_resource_id
  path_part = "upload-image-private"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodUploadImagePrivate_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePrivate_sec.id
  http_method = "OPTIONS"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_method" "ApiGatewayMethodUploadImagePrivate_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePrivate_sec.id
  http_method = "POST"
  authorization = "NONE"
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodUploadImagePrivate_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePrivate_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${module.Image_Uploader_secondary.lambda_function_invoke_arn}"  
  credentials = module.apigateway_put_events_to_lambda_us_east_1.iam_role_arn
        provider = aws.region2
}

resource "aws_api_gateway_integration" "ApiGatewayMethodUploadImagePrivate_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePrivate_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec_options.http_method
  type = "MOCK"
  passthrough_behavior = "WHEN_NO_MATCH"
        provider = aws.region2

  request_templates = {
    "application/json" = jsonencode({statusCode = 200})
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodUploadImagePrivate_sec_options" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePrivate_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec_options.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "ApiGatewayMethodUploadImagePrivate_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePrivate_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec.http_method
  status_code = "200"
        provider = aws.region2


  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodUploadImagePrivate_sec" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePrivate_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec_options.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodUploadImagePrivate_sec_options.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec,
    aws_api_gateway_integration.ApiGatewayMethodUploadImagePrivate_sec_options
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

}

resource "aws_api_gateway_integration_response" "ApiGatewayMethodUploadImagePrivate_sec_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api_sec.id
  resource_id = aws_api_gateway_resource.ApiGatewayMethodUploadImagePrivate_sec.id
  http_method = aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec.http_method
  status_code = aws_api_gateway_method_response.ApiGatewayMethodUploadImagePrivate_sec.status_code
        provider = aws.region2

  depends_on = [
    aws_api_gateway_method.ApiGatewayMethodUploadImagePrivate_sec,
    aws_api_gateway_integration.ApiGatewayMethodUploadImagePrivate_sec
  ]

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'",
  }
}
