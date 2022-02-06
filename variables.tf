variable "aws_region" {
  description = "AWS region to apply terraform to."
  default     = ""
  type        = string
}
variable "name" {
  description = "SNS Topic Name"
  type        = string
  default     = ""
}
variable "alert_mobiles" {
  description = "Mobile numbers (in +44... format) to be registered for SNS Alert notification"
  type = list(string)
  default = []
}
variable "alert_emails" {
  description = "Email addresses to be registered for SNS Alert notification"
  type = list(string)
  default = []
}
variable "default_tags" {
  description = "Default Tags"
  type        = map(string)
  default     = {}
}