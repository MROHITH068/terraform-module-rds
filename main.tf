resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.component}-${var.env}-sg"
  }
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "${var.component}-${var.env}"
  engine                  = var.engine
  engine_version          = var.engine_version
  database_name           = var.database_name
  master_username         = data.aws_ssm_parameter.username.value
  master_password         = data.aws_ssm_parameter.password.value

}

