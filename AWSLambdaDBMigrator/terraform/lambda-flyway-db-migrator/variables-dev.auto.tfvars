environment             = "dev"
vpc_id                 = "vpc-0f845288e2eb09a74"
vpc_private_subnets_ids = ["subnet-0350a5ca693adf84f", "subnet-06d0a8f930055b1ce"]
api_gw_endpoint_sg      = ["sg-0d04a855af37e43f5"]
security_group_ingress_cidr_list = ["172.30.0.0/22", "10.248.36.0/24", "0.0.0.0/0"]
security_group_egress_lambda_cidr_list = ["10.248.36.0/24","172.30.0.0/22"]
aws_account = "557015566802"
aws_region = "eu-west-2"
scope_permission_boundary_policy_name = "are-dbmigrator-avm-scope-permissions"
rds_database={
  username ="postgres"
  password="Tempa55123!!"
  db_name="postgres"
  port=5432
}
clean_schema=true
init_sql="drop schema if exists dbmigrator cascade"