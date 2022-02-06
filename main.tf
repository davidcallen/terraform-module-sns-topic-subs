resource "aws_sns_topic" "cloudwatch-alarms-sns-topic" {
  name              = var.name
  # Remove the encryption cause Cloudwatch cannot use the default KMS key.
  #  See https://aws.amazon.com/premiumsupport/knowledge-center/cloudwatch-receive-sns-for-alarm-trigger/
  kms_master_key_id = ""
  # "alias/aws/sns"
  # Ideally there should be an "authenticate_on_unsubscribe" which would enable us to prevent people clicking on unsubsribe link
  #   See https://aws.amazon.com/premiumsupport/knowledge-center/prevent-unsubscribe-all-sns-topic/
  # authenticate_on_unsubscribe = true
  tags              = var.default_tags
}

resource "aws_sns_topic_subscription" "cloudwatch-alarms-sns-topic-subscription-email" {
  count     = length(var.alert_emails)
  topic_arn = aws_sns_topic.cloudwatch-alarms-sns-topic.arn
  protocol  = "email"
  endpoint  = var.alert_emails[count.index]
}

resource "aws_sns_topic_subscription" "cloudwatch-alarms-sns-topic-subscription" {
  count     = length(var.alert_mobiles)
  topic_arn = aws_sns_topic.cloudwatch-alarms-sns-topic.arn
  protocol  = "sms"
  endpoint  = var.alert_mobiles[count.index]
}
