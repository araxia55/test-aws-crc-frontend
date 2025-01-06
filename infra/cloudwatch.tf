resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  alarm_name          = "BillingAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Maximum"
  threshold           = "1"
  actions_enabled     = true
  alarm_description   = "Alarm when estimated charges exceed $1"
  dimensions = {
    Currency = "USD"
  }
  alarm_actions = [
    "arn:aws:sns:us-east-1:123456789012:my-sns-topic"
  ]
}