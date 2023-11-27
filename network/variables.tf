variable "cidr_block_vpc" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "enabled_dns_support" {
  description = "Whether to enable DNS support"
  type        = bool
  default     = true
}

variable "enabled_dns_hostnames" {
  description = "Whether to enable DNS hostnames"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
  default     = {}
}

variable "cidr_block_subnet" {
  description = "The CIDR block for the subnet"
  type        = string
}