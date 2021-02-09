

resource "aws_rds_cluster_instance" "cluster_instances1" {
  count              = 1
  identifier         = "aurora-cluster-testt-${count.index}"
  cluster_identifier = aws_rds_cluster.default1.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.default1.engine
  publicly_accessible = true
}

resource "aws_rds_cluster" "default1" {
  cluster_identifier = "aurora-cluster-test2"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  engine             = "aurora-postgresql"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "barbut8chars"
  skip_final_snapshot  = true
}
