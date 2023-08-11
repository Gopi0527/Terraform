variable "vpc_network_cidr" {
  description = "This is network cidr range"
  type        = string
  default     = "10.10.0.0/16"
}
variable "web1_subnet_cidr" {
  type        = string
  default     = "10.10.0.0/24"
  description = "This is web1 subnet cidr"
}
variable "app_subnet_cidr" {
  type        = string
  default     = "10.10.1.0/24"
  description = "This is app subnet cidr"
}
variable "db_subnet_cidr" {
  type        = string
  default     = "10.10.2.0/24"
  description = "This is db subnet cidr"
}
variable "web2_subnet_cidr" {
  description = "This is network cidr range"
  type        = string
  default     = "10.10.3.0/24"
}
variable "app2_subnet_cidr" {
  description = "This is network cidr range"
  type        = string
  default     = "10.10.4.0/24"
}
variable "db2_subnet_cidr" {
  description = "This is network cidr range"
  type        = string
  default     = "10.10.5.0/24"
}
 