provider "aws" {
  region = "us-west-2"
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "aurora-cluster-test-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.default.engine
  publicly_accessible = true
}

resource "aws_rds_cluster" "default" {
  cluster_identifier = "aurora-cluster-test1"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  engine             = "aurora-postgresql"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "barbut8chars"
  skip_final_snapshot  = true
}

