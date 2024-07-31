terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    snowsql = {
          source  = "aidanmelen/snowsql"
          version = ">= 1.3.3"  
        }
  }

  backend "azurerm" {
    resource_group_name  = "rg_sf_terraform_backend"
    storage_account_name = "saterraformbackend22"
    container_name       = "terrafornstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "snowflake" {
  account     = var.snowflake_account
  user        = var.snowflake_username
  password    = var.snowflake_password
  role        = var.snowflake_role
}
provider "snowsql" {
  account     = var.snowflake_account
  username        = var.snowflake_username
  password    = var.snowflake_password
  role        = var.snowflake_role
}


module "snowflake_warehouse" {
  source = "./modules/snowflake_warehouse"

  name                                  = "my_warehouse"
  comment                               = "This is my warehouse"
  size                                  = "LARGE"
  auto_suspend                          = 60
  auto_resume                           = true
  initially_suspended                   = true
  enable_query_acceleration             = false
  query_acceleration_max_scale_factor   = null
  warehouse_type                        = "STANDARD"
  max_concurrency_level                 = 8
  statement_queued_timeout_in_seconds   = 0
  statement_timeout_in_seconds          = 172800
}



module "snowflake_database" {
  source = "./modules/snowflake_database"

  name                        = "my_database"
  is_transient                = false
  comment                     = "This is my database"
  data_retention_time_in_days = 1
}


module "snowflake_role" {
  source = "./modules/snowflake_role"

  name                        = "role_1"
  comment                     = "Sample role"
}

module "snowflake_user" {
  source = "./modules/snowflake_user"

  name                    = "my_user"
  comment                 = "sample user"
  disabled                = false
  default_warehouse       = "my_warehouse"
  default_namespace       = ""
  default_role            = "SYSADMIN"
  rsa_public_key          = null
  rsa_public_key_2        = null
  must_change_password    = false
  password                = "my_password"
  email                   = "user@example.com"
  first_name              = "First"
  last_name               = "Last"
  default_secondary_roles = ["ALL"]
}

module "snowflake_grant_account_role" {
  source           = "./modules/snowflake_grants"
  
  role_name        = "role_1"
  user_name        = "my_user"
}

module "snowflake_schema" {
  source           = "./modules/snowflake_schema"
  
  database_name    = "my_database"
  schema_name      = "sample_schema"
  schema_comment   = "This is a sample schema for demonstration purposes."
  data_retention_days = -1
  is_managed = false
  is_transient = false
}
/*resource "snowflake_unsafe_execute" "test1" {
  execute = "CREATE DATABASE if not exists ABC"
  revert = "select 1"
}*/
resource "snowsql_exec" "role" {
create {
 statements           = <<-EOT
 USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS DB_DG;
CREATE SCHEMA IF NOT EXISTS DB_DG.SCH_DG;

CREATE OR REPLACE TABLE DB_DG.SCH_DG.CUSTOMERS (
  id integer, -- auto incrementing IDs
  name varchar (100),  -- variable string column
  gender varchar,
  city string, -- column used to store JSON type of data
  nationkey int,
  email varchar,
  createdatetime TIMESTAMP_NTZ,
  MICode varchar(10),
  constraint CUST_UK unique (NAME)
);

INSERT INTO CUSTOMERS VALUES 
(1,'Alice Franklin','F','New York',10018, 'alice@hotmail.com', '2013-05-08T23:39:20.123','AF_1'),
(2,'Dan Smith','M','San Francisco',10039, 'd.smith@gmail.com', '2013-05-08T23:39:20.123','SF_2'),
(3,'Brian Jones','M','Chicago',10024, 'bjones@hotmail.com', '2013-05-09T23:39:20.123','BJ_3'),
(4,'Ethan Brown','M','Houston',10011, 'ethanbrown@hotmail.com', '2013-05-10T23:39:20.123','EB_4'),
(5,'Lily Scott','F','Chicago',10052, 'lscott@gmail.com', '2013-05-12T23:39:20.123','LS_5'),
(6,'Lily Scott','F','Chicago',10052, 'lscott@gmail.com', '2013-05-12T23:39:20.123','LS_5');
--select * from customers

CREATE ROLE IF NOT EXISTS DE_ROLE;
CREATE ROLE IF NOT EXISTS DA_ROLE;
 
GRANT ROLE DE_ROLE TO USER VAIP;
GRANT ROLE DA_ROLE TO USER VAIP;
 
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE DE_ROLE;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE DA_ROLE;
 
 
GRANT USAGE ON DATABASE DB_DG TO ROLE DA_ROLE;
GRANT USAGE ON SCHEMA DB_DG.SCH_DG TO ROLE DA_ROLE;
GRANT SELECT ON TABLE DB_DG.SCH_DG.CUSTOMERS TO ROLE DA_ROLE;

use role accountadmin;
GRANT USAGE ON DATABASE DB_DG TO ROLE DE_ROLE;
GRANT USAGE ON SCHEMA DB_DG.SCH_DG TO ROLE DE_ROLE;
GRANT SELECT,update ON TABLE DB_DG.SCH_DG.CUSTOMERS TO ROLE DE_ROLE;
EOT
}
delete {
  statements = "select 1;"

}

}
