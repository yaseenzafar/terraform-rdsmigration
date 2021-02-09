# Create source endpoint
  resource "aws_dms_endpoint" "test12" {
  database_name               = "mydb"
  endpoint_id                 = "target-ep"
  count = 1
  endpoint_type               = "target"
  engine_name                 = "aurora-postgresql"
  password                    = "barbut8chars"
  port                        = 5432
  server_name                 = aws_rds_cluster_instance.cluster_instances1[count.index].endpoint
  ssl_mode                    = "none"

  tags = {
    Name = "test2"
  }

    username = "foo"
}