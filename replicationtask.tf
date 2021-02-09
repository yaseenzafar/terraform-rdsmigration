# Create a new replication task
  resource "aws_dms_replication_task" "test" {
  migration_type            = "full-load"
  count = 1
  replication_instance_arn  = aws_dms_replication_instance.replication-instance.replication_instance_arn
  replication_task_id       = "test-dms-replication-task-tf"
  source_endpoint_arn       = aws_dms_endpoint.test1[count.index].endpoint_arn
  table_mappings            = "{\"rules\":[{\"rule-type\":\"selection\",\"rule-id\":\"1\",\"rule-name\":\"1\",\"object-locator\":{\"schema-name\":\"%\",\"table-name\":\"%\"},\"rule-action\":\"include\"}]}"

  tags = {
    Name = "test"
  }

  target_endpoint_arn = aws_dms_endpoint.test12[count.index].endpoint_arn
}