variable "name" {
  description = "Name of the DB"
}

variable "username" {
  description = "Root username."
}

variable "password" {
  description = "Initial password for the root user."
}

variable "vpc_id" {
  description = "The ID of the VPC where the instance will live"
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = "list"
}
variable "security_group_ids" {
  description = "A list of Security Groups that will be assigned to the mastar instance"
  type        = "list"
}

variable "parameter_group_name" {
  description = "Id of the parameter group for the engine of RDS"
  default     = ""
}

variable "db_name" {
  description = "Standard Name of the Database"
  default     = ""
}

variable "storage" {
  description = "How many GBs will be provisioned"
  default     = 100
}

variable "storage_type" {
  description = "Storage type"
  default     = "gp2"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  default = false
}

variable "provisioned_iops" {
  description = "Provisioned IOPS for storage type io1"
  default     = 0
}

variable "engine" {
  description = "Engine type"
  default     = "mysql"
}

variable "mysql_engine_version" {
  description = "Default MySQL Engine version"
  default     = "5.7.16"
}

variable "mariadb_engine_version" {
  description = "Default MariaDB Engine version"
  default     = "10.1.19"
}

variable "postgres_engine_version" {
  description = "Default PostgreSQL Engine version"
  default     = "9.6.1"
}

variable "master_instance_class" {
  description = "Master Instance class"
  default     = "db.m4.xlarge"
}

variable "replica_instance_class" {
  description = "Replica Instance class"
  default     = "db.m4.xlarge"
}

variable "multi_az" {
  description = "If you want the instance to be Multi-AZ or not"
  default     = true
}

variable "master_publicly_accessible" {
  description = "If the master instance will be publicly accessible"
  default     = false
}

variable "snapshot_identifier" {
  description = "Create and RDS instance from RDS snapshot"
  default     = ""
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  default     = true
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  default     = "rds-snapshot"
}

variable "copy_tags_to_snapshot" {
    description = "On delete, copy all Instance tags to the final snapshot"
    default     = true
}

variable "apply_immediately" {
  description = "If the changes should be inmmedately applied"
  default     = true
}

variable "mysql_port" {
  description = "MySQL Default Listening Port"
  default     = 3306
}

variable "postgres_port" {
  description = "PostgreSQL Default Listening Port"
  default     = 5432
}

variable "backup_window" {
  description = "Backup window"
  default     = "01:00-01:30"
}

variable "maintenance_window" {
  description = "Maintenance window date"
  default     = "tue:01:30-tue:02:00"
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance"
  default     = 1
}

variable "backup_retention_period" {
  description = "Retention period"
  default     = 7
}

# READ REPLICAS

variable "replica_count" {
  description = "How many replicas should be initialized"
  default     = 0
}

variable "replica_publicly_accessible" {
  description = "Should the replica instance will be publicly accessible"
  default     = false
}

variable "replica_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  default     = false
}

variable "replica_security_group_ids" {
  description = "A list of Security Groups that will be assigned to the slave instance"
  type        = "list"
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = "map"
}

variable "auto_minor_version_upgrade" {
  description = "Set auto minor version updgrade for Master"
  default     = false
}

variable "allow_major_version_upgrade" {
  description = "Set allow major version updgrade for Master"
  default     = false
}

variable "replica_auto_minor_version_upgrade" {
  description = "Set auto minor version updgrade for Master"
  default     = false
}

variable "replica_allow_major_version_upgrade" {
  description = "Set allow major version updgrade for Master"
  default     = false
}
