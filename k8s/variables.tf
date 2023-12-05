variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC"
  type        = bool
  default     = true

}
variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to create the instance in"
  type        = string
}

variable "volume_size" {
  description = "The size of the volume in gigabytes"
  type        = number
  default     = 10
}

variable "volume_type" {
  description = "The type of the volume"
  type        = string
  default     = "gp3"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "tags_instance" {
  description = "A mapping of tags to assign to the resource"
  type        = string
}
variable "worker_count" {
  description = "Number instances of workers"
  type        = number
  default     = 1
}

variable "security_groups" {
  description = "List of security group IDs to enable on the EC2 instance"
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "ID of the my subnet"
  type        = string
}