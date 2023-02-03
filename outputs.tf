// FQDN of the master instance
output "address" {
  value       = "${aws_db_instance.master.address}"
  description = "FQDN of the master instance"
}

// The ARN of the RDS instance
output "arn" {
  value       = "${aws_db_instance.master.arn}"
  description = "The ARN of the RDS instance"
}

// The ARN of the db subnet group
output "db_subnet_group_arn" {
  value       = "${aws_db_subnet_group.main.arn}"
  description = "The ARN of the db subnet group"
}

// The name of the db subnet group
output "db_subnet_group_id" {
  value       = "${aws_db_subnet_group.main.id}"
  description = "The name of the db subnet group"
}

// The connection endpoint of the master instance
output "endpoint" {
  value       = "${aws_db_instance.master.endpoint}"
  description = "The connection endpoint of the master instance"
}

// The database engine
output "engine" {
  value       = "${aws_db_instance.master.engine}"
  description = "The database engine"
}

// The database engine version
output "engine_version" {
  value       = "${aws_db_instance.master.engine_version}"
  description = "The database engine version"
}

// The Amazon Resource Name (ARN) specifying the role of the RDS instance
output "iam_role_arn" {
  value       = "${aws_iam_role.enhanced_monitoring.arn}"
  description = "The Amazon Resource Name (ARN) specifying the role of the RDS instance"
}

// The RDS instance ID
output "id" {
  value       = "${aws_db_instance.master.id}"
  description = "The RDS instance ID"
}

// The name of the RDS instance
output "identifier" {
  value       = "${var.name}"
  description = "The name of the RDS instance"
}

// The RDS instance class
output "instance_class" {
  value       = "${aws_db_instance.master.instance_class}"
  description = "The RDS instance class"
}

// Port of the master instance
output "port" {
  value       = "${aws_db_instance.master.port}"
  description = "Port of the master instance"
}

// Output for resource dependency, will output as soon as the RDS Master Instance is ready
output "rds_db_ready" {
  value       = "${null_resource.rds_db_ready.id}"
  description = "Output for resource dependency, will output as soon as the RDS Master Instance is ready"
}

output "replica_address" {
  value       = "${join(",", aws_db_instance.replica.*.address)}"
  description = "FQDN of the replica instance(s)"
}

// The connection(s) endpoint(s) of the slave(s) instance(s)
output "replica_endpoints" {
  value       = "${join(",", aws_db_instance.replica.*.endpoint)}"
  description = "The connection(s) endpoint(s) of the slave(s) instance(s)"
}
