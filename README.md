# tf-aws-rds

## Overview

Creates an RDS master instance with optional replicas.

## Usage:
```
module "rds" {
  source                     = "../modules/tf-aws-rds"

  subnet_ids                 = ["subnet-4ab34e12", "subnet-9j5gs95s"]
  vpc_id                     = "${aws_vpc.main.vpc_id}"
  name                       = "my-rds-instance"
  username                   = "mariadb"
  password                   = "mariadbs"
  engine                     = "mariadb"
  backup_retention_period    = 5
  security_group_ids         = ["sg-27214e40", "sg-98hg11lm"]

  replica_count              = 1
  replica_security_group_ids = ["sg-27214e40", "sg-98hg11lm"]

    country = "germany"
    region  = "central"
    project = "artifactory"
  }
}
```

## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| name | Name of the DB | - | yes |
| username | Root username. | - | yes |
| password | Initial password for the root user. | - | yes |
| vpc_id | The ID of the VPC where the instance will live | - | yes |
| subnet_ids | A list of subnet IDs | - | yes |
| security_group_ids | A list of Security Groups that will be assigned to the mastar instance | - | yes |
| parameter_group_name | Id of the parameter group for the engine of RDS | `""` | no |
| db_name | Standard Name of the Database | `""` | no |
| storage | How many GBs will be provisioned | `100` | no |
| storage_type | Storage type | `"gp2"` | no |
| storage_encrypted | Specifies whether the DB instance is encrypted | `"false"` | no |
| provisioned_iops | Provisioned IOPS for storage type io1 | `0` | no |
| engine | Engine type | `"mysql"` | no |
| mysql_engine_version | Default MySQL Engine version | `"5.7.16"` | no |
| mariadb_engine_version | Default MariaDB Engine version | `"10.1.19"` | no |
| postgres_engine_version | Default PostgreSQL Engine version | `"9.6.1"` | no |
| master_instance_class | Master Instance class | `"db.m4.xlarge"` | no |
| replica_instance_class | Replica Instance class | `"db.m4.xlarge"` | no |
| multi_az | If you want the instance to be Multi-AZ or not | `true` | no |
| master_publicly_accessible | If the master instance will be publicly accessible | `false` | no |
| snapshot_identifier | Create and RDS instance from RDS snapshot | `""` | no |
| skip_final_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. | `true` | no |
| final_snapshot_identifier | The name of your final DB snapshot when this DB instance is deleted. | `"rds-snapshot"` | no |
| copy_tags_to_snapshot | On delete, copy all Instance tags to the final snapshot | `true` | no |
| apply_immediately | If the changes should be inmmedately applied | `true` | no |
| mysql_port | MySQL Default Listening Port | `3306` | no |
| postgres_port | PostgreSQL Default Listening Port | `5432` | no |
| backup_window | Backup window | `"01:00-01:30"` | no |
| maintenance_window | Maintenance window date | `"tue:01:30-tue:02:00"` | no |
| monitoring_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance | `1` | no |
| backup_retention_period | Retention period | `7` | no |
| replica_count | How many replicas should be initialized | `0` | no |
| replica_publicly_accessible | Should the replica instance will be publicly accessible | `false` | no |
| replica_skip_final_snapshot | Determines whether a final DB snapshot is created before the DB replica instance is deleted. | `false` | no |
| replica_security_group_ids | A list of Security Groups that will be assigned to the slave instance | - | yes |
| auto_minor_version_upgrade | Minor version upgrade for Master | false | no |
| allow_major_version_upgrade | Major version upgrade for Master | false | no |
| replica_auto_minor_version_upgrade | Minor version upgrade for Replica | false | no |
| replica_allow_major_version_upgrade | Major version upgrade for Replica | false | no |
| tags | A mapping of tags to assign to the resource | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| address | FQDN of the master instance |
| arn | The ARN of the RDS instance |
| db_subnet_group_arn | The ARN of the db subnet group |
| db_subnet_group_id | The name of the db subnet group |
| endpoint | The connection endpoint of the master instance |
| engine | The database engine |
| engine_version | The database engine version |
| iam_role_arn | The Amazon Resource Name (ARN) specifying the role of the RDS instance |
| id | The RDS instance ID |
| identifier | The name of the RDS instance |
| instance_class | The RDS instance class |
| port | Port of the master instance |
| rds_db_ready | Output for resource dependency, will output as soon as the RDS Master and Replica(s) Instances are ready |
| replica_address | FQDN of the replica instance(s) |
| replica_endpoints | The connection(s) endpoint(s) of the slave(s) instance(s) |
