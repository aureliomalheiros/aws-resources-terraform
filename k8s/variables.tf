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

variable "vpc_security_group_ids" {
  description = "List of security group IDs to enable on the EC2 instance"
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "ID of the my subnet"
  type        = string
}


#Variables of the file network.tf 
variable "tags_network" {
  description = "A mapping of tags to assign to the network"
  type        = map(string)
  default     = {}
}
variable "number_subnets" {
  description = "The number of subnet in the project"
  type        = number
}

#Variable to security group

variable "security_groups" {
  description = "A map of security groups"
  type = map(object({
    name        = string
    description = string
    ingress = list(object({
      description      = string
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
      prefix_list_ids  = list(string)
      security_groups  = list(string)
    }))
    egress = list(object({
      description      = string
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
      prefix_list_ids  = list(string)
      security_groups  = list(string)
    }))
    tags = map(string)
  }))
  default = {}
}

variable "network_acl" {
  description = "A map of network acl"
  type = map(object({
    egress = list(object({
      protocol   = string
      rule_no    = number
      action     = string
      cidr_block = string
      from_port  = number
      to_port    = number
    }))
    ingress = list(object({
      protocol   = string
      rule_no    = number
      action     = string
      cidr_block = string
      from_port  = number
      to_port    = number
    }))
    tags = map(string)
  }))
}