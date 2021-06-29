# make the sqs as event source for lambda trigger
resource "aws_lambda_event_source_mapping" "sqs_event_source" {
  event_source_arn = aws_sqs_queue.test_queue.arn
  function_name    = aws_lambda_function.test_lambda.arn 
  enabled =  true 
}
