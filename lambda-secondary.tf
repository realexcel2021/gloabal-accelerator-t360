module "lambda_secondary" { # loadbalancer guy here!
  source = "terraform-aws-modules/lambda/aws"

  allowed_triggers = {
  }

  providers = {
    aws = aws.region2
  }


  function_name = "Website-global-accelerator-secondary"
  role_name     = "Website-global-accelerator-secondary"
  description   = "Serves as the root handler behind the Web ALB"  
  handler       = "main.lambda_handler"
  runtime       = "python3.11"
  architectures = ["x86_64"]
  timeout       = 60
  tracing_mode  = "PassThrough"
  publish       = true
  store_on_s3   = false
  memory_size   = 128

  source_path = "${path.module}/src/demo/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   number_of_policies = 2
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
}

resource "aws_lambda_layer_version" "lambda_layer_sec" {
  filename   = "src/python-layer.zip"
  layer_name = "t360-layer"

  provider = aws.region2

  compatible_runtimes = ["python3.11", "python3.9", "python3.10", "python3.8"]
}


module "CreateRemittanceTableLambdaFunction_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]

  providers = {
    aws = aws.region2
  }


  function_name = "tf-CreateRemittanceTable-secondary"
  handler       = "api.create_remittance_table"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/Api/"

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

   attach_policy_statements = true
   policy_statements = {

     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}


module "DropRemittanceTableLambdaFunction_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]

  providers = {
    aws = aws.region2
  }

  function_name = "tf-DropRemittanceTable_secondary"
  handler       = "api.drop_remittance_table"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/Api/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


   attach_policy_statements = true
   policy_statements = {

     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}



module "GetRemittancesLambdaFunction_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]

  providers = {
    aws = aws.region2
  }

  function_name = "tf-GetRemittances-secondary"
  handler       = "api.get_remittances"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/Api/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


   attach_policy_statements = true
   policy_statements = {

     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}


module "CreateRemittanceLambdaFunction_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]

  providers = {
    aws = aws.region2
  }


  function_name = "tf-CreateRemittance-secondary"
  handler       = "api.create_remittance"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/Api/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


   attach_policy_statements = true
   policy_statements = {

     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}


module "UpdateRemittanceLambdaFunction_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]

  providers = {
    aws = aws.region2
  }

  function_name = "tf-UpdateRemittance_secondary"
  handler       = "api.update_remittance"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/Api/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

   attach_policy_statements = true
   policy_statements = {

     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}


module "DeleteRemittanceLambdaFunction_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]

  providers = {
    aws = aws.region2
  }

  function_name = "tf-DeleteRemittance_secondary"
  handler       = "api.delete_remittance"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/Api/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

   attach_policy_statements = true
   policy_statements = {

     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}


module "ClearRemittancesLambdaFunction_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]

  providers = {
    aws = aws.region2
  }

  function_name = "tf-ClearRemittances_secondary"
  handler       = "api.clear_remittances"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/Api/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

   attach_policy_statements = true
   policy_statements = {

     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}


module "Image_Uploader_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]
  providers = {
    aws = aws.region2
  }

  function_name = "Image_Uploader_secondary"
  handler       = "api.handler"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/ImageUploader/"

  environment_variables = {
    BUCKET_NAME = "${module.s3_bucket.s3_bucket_id}"
  }

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole", "arn:aws:iam::aws:policy/AmazonS3FullAccess"]
   number_of_policies = 3

   attach_policy_statements = true
   policy_statements = {
     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}

module "Image_Uploader_public_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]
  providers = {
    aws = aws.region2
  }

  function_name = "Image_Uploader_Public-secondary"
  handler       = "index.handler"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/s3Upload/"

  environment_variables = {
    BUCKET_NAME = "${module.s3_bucket_public.s3_bucket_id}"
  }

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole", "arn:aws:iam::aws:policy/AmazonS3FullAccess"]
   number_of_policies = 3

   attach_policy_statements = true
   policy_statements = {
     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}


module "Create_Revenue_Table_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]
  providers = {
    aws = aws.region2
  }

  function_name = "Create_Revenue_Table_secondary"
  handler       = "api.revenue_codes"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/EventBridgeApi/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

   attach_policy_statements = true
   policy_statements = {
     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}



module "Create_Revenue_Item_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]
  providers = {
    aws = aws.region2
  }

  event_source_mapping = {
    sqs = {
      function_response_types = ["ReportBatchItemFailures"]
      event_source_arn = "${aws_sqs_queue.queue_secondary.arn}"
    }
  }

  allowed_triggers = {
    sqs = {
      principal  = "sqs.amazonaws.com"
      source_arn = "${aws_sqs_queue.queue_secondary.arn}"
    }
  }

  function_name = "Create_Revenue_Item-secondary"
  handler       = "api.create_item"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 60
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/EventBridgeApi/"

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   policies           = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", 
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
    ]
   number_of_policies = 3

   attach_policy_statements = true
   policy_statements = {
     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}



module "Get_Revenue_Item_secondary" {
  source = "terraform-aws-modules/lambda/aws"
  layers = [ aws_lambda_layer_version.lambda_layer_sec.arn, "arn:aws:lambda:${var.region2}:580247275435:layer:LambdaInsightsExtension:21" ]

  providers = {
    aws = aws.region2
  }

  function_name = "Get_Revenue_Item_secondary"
  handler       = "api.get_item"
  runtime       = "python3.8"
  architectures = ["x86_64"]
  timeout       = 900
  tracing_mode  = "Active"
  publish       = true
  store_on_s3   = false
  memory_size   = 1024

  source_path = "${path.module}/src/EventBridgeApi/"

  vpc_subnet_ids = module.vpc_secondary.private_subnets
  vpc_security_group_ids = [module.LambdaSecurityGroup_secondary.security_group_id]

   attach_policies    = true
   policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
   number_of_policies = 2

  environment_variables = {
    SECRET_NAME = "database-terraform_secret-${random_pet.this.id}"
    REGION      = var.region2
  }


   attach_policy_statements = true
   policy_statements = {
     secrets_manager = {
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
     }
   }
}

