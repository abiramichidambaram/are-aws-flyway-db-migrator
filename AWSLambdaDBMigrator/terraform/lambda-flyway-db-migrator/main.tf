module "are_rds_flyway_lambda_db_migrator" {
  source                                = "git::git@github.com:are-sg/are-tfc-terraform.git//AWSRDSDBMigrator?ref=aws_rds_db_migrator"
  lambda                                = var.lambda_map.db_migrator_lambda
  lambda_vpc_private_subnet_ids         = var.vpc_private_subnets_ids
  vpc_id                                = var.vpc_id
  aws_account                           = var.aws_account
  aws_region                            = var.aws_region
  environment                           = var.environment
  api_gw_endpoint_sg                    = var.api_gw_endpoint_sg
  security_group_ingress_cidr_list      = var.security_group_ingress_cidr_list
  security_group_egress_lambda_cidr_list = var.security_group_egress_lambda_cidr_list
  scope_permission_boundary_policy_name  = var.scope_permission_boundary_policy_name
  variables                             = {
    MICRONAUT_ENVIRONMENTS              = var.environment
    AWS_SECRET_MANAGER_ENABLED          = var.lambda_map.db_migrator_lambda.secret_manager_enabled
    DB_RUNTIME_PORT                     = var.rds_database.port
    DB_RUNTIME_DB_NAME                  = var.rds_database.db_name
    DB_RUNTIME_CLEAN_SCHEMA             = var.clean_schema
    DB_RUNTIME_INIT_SQL                 = var.init_sql
  }
  
  secret_variables                   = {
    "application.db.flyway.username" = var.rds_database.username
    "application.db.flyway.password" = var.rds_database.password
  }
}

data "aws_lambda_invocation" "are_rds_db_migrator" {
  function_name = module.are_rds_flyway_lambda_db_migrator.lambda_name
  input         = jsonencode({})
  depends_on    = [ module.are_rds_flyway_lambda_db_migrator]
}