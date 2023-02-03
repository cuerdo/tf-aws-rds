resource "aws_db_instance" "replica" {
  count                  = "${var.replica_count}"
  identifier             = "${var.name}-replica-${count.index + 1}"
  replicate_source_db    = "${aws_db_instance.master.id}"

  #Default value is MySQL, but you can also choose MariaDB or PostgreSQL
  engine_version              = "${var.engine == "mariadb" ? var.mariadb_engine_version : var.engine == "postgres" ? var.postgres_engine_version : var.mysql_engine_version}"

  instance_class              = "${var.replica_instance_class}"
  publicly_accessible         = "${var.replica_publicly_accessible}"
  skip_final_snapshot         = "${var.replica_skip_final_snapshot}"
  storage_type                = "${var.provisioned_iops > 0 ? "io1" : var.storage_type}"
  iops                        = "${var.provisioned_iops}"
  maintenance_window          = "${var.maintenance_window}"
  vpc_security_group_ids      = [ "${var.replica_security_group_ids}" ]
  monitoring_role_arn         = "${aws_iam_role.enhanced_monitoring.arn}"
  monitoring_interval         = "${var.monitoring_interval}"
  auto_minor_version_upgrade  = "${var.replica_auto_minor_version_upgrade}"
  allow_major_version_upgrade = "${var.replica_allow_major_version_upgrade}"
  tags                        = "${merge(map("Name", "${var.name}-replica-${count.index + 1}"), "${var.tags}")}"
}
