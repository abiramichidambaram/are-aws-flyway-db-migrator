variable "lambda_map" {
  type = map(any)
    db_migrator_lambda = {
      memory_size    = 2048
      name           = "flyway-db-migrator"
      source_path    = "are-aws-lambda-deployment-bucket/lambda-flyway-db-migrator-0.0.1-SNAPSHOT.jar"
      fileName       = "lambda-flyway-db-migrator-0.0.1-SNAPSHOT.jar"
      lambda_handler = "io.micronaut.function.aws.proxy.MicronautLambdaHandler"
      secret_manager_enabled= true
    }
  }

variable "rds_database" {
  type = object({
    username=string
    password=string
    db_name=string
    port=number
  })
  default = {
    username=""
    password=""
    db_name=""
    port=5432
  }
}

variable "vpc_id" {
  description = "vpc Id"
  type        = string
}


variable "vpc_private_subnets_ids" {
  description = "VPC Private Subnets"
  type        = list(string)
}

variable "security_group_ingress_cidr_list" {
  description = "Allowed ingress Security Groups"
  type        = list(string)
}

variable "security_group_egress_lambda_cidr_list" {
  description = "Allowed egress lambda Security Groups"
  type        = list(string)
}

variable "environment" {
  description = "deployment environment"
  type        = string
}

variable "clean_schema" {
  description = "Set whether Flyway will clean the schema before running the migrations. Default value (false)."
  type        = bool
  default     = false
}

variable "init_sql" {
  description = "Set whether Flyway to initialise db with provided sql query"
  type        = string
}

variable "aws_account" {
  description = "AWS Account"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "scope_permission_boundary_policy_name" {
  description = "scope-permission-boundary-policy"
  type        = string
}

variable "api_gw_endpoint_sg" {
  description = "API Gateway Endpoint Security Groups"
  type        = list(string)
  default     = []
  }
  
  

