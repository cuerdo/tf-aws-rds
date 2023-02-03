resource "aws_db_subnet_group" "main" {
  name        = "${var.name}"
  description = "${var.name} RDS subnet group"
  subnet_ids  = [ "${var.subnet_ids}" ]
  tags        = "${var.tags}"
}
