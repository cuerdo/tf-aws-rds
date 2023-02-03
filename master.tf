resource "aws_db_instance" "master" {
  identifier                  = "${var.name}"
  storage_type                = "${var.provisioned_iops > 0 ? "io1" : var.storage_type}"
  storage_encrypted           = "${var.storage_encrypted}"
  iops                        = "${var.provisioned_iops}"
  allocated_storage           = "${var.storage}"
  engine                      = "${var.engine}"

  #Default value is MySQL, but you can also choose MariaDB or PostgreSQL
  engine_version              = "${var.engine == "mariadb" ? var.mariadb_engine_version : var.engine == "postgres" ? var.postgres_engine_version : var.mysql_engine_version}"

  #Default value is 3306 (MySQL/MariaDB), but you can also choose PostgreSQL
  port                        = "${var.engine != "mysql" && var.engine != "mariadb" ? var.postgres_port : var.mysql_port}"

  instance_class              = "${var.master_instance_class}"
  name                        = "${var.db_name}"
  username                    = "${var.username}"
  password                    = "${var.password}"
  multi_az                    = "${var.multi_az}"
  apply_immediately           = "${var.apply_immediately}"
  db_subnet_group_name        = "${aws_db_subnet_group.main.id}"
  vpc_security_group_ids      = [ "${var.security_group_ids}" ]
  parameter_group_name        = "${var.parameter_group_name}"
  backup_window               = "${var.backup_window}"
  backup_retention_period     = "${var.backup_retention_period}"
  maintenance_window          = "${var.maintenance_window}"
  monitoring_role_arn         = "${aws_iam_role.enhanced_monitoring.arn}"
  monitoring_interval         = "${var.monitoring_interval}"
  publicly_accessible         =  "${var.master_publicly_accessible}"
  snapshot_identifier         = "${var.snapshot_identifier}"
  skip_final_snapshot         = "${var.skip_final_snapshot}"
  final_snapshot_identifier   = "${var.final_snapshot_identifier}"
  copy_tags_to_snapshot       = "${var.copy_tags_to_snapshot}"
  auto_minor_version_upgrade  = "${var.auto_minor_version_upgrade}"
  allow_major_version_upgrade = "${var.allow_major_version_upgrade}"


  tags                        = "${merge(map("Name", "${var.name}-master"), "${var.tags}")}"
}

resource "null_resource" "rds_db_ready" {
  depends_on = [ "aws_db_instance.master", "aws_db_instance.replica" ]
}
