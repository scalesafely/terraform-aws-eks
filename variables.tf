variable "project_name" {
  description = "Project name can be the site name or the client name"
  type        = string
}

variable "environment" {
  description = "The type of environement to be deployed eg. production, stagging"
  type        = string
  default     = "prod"
}

variable "instance_types" {
  description = "The type of isntance"
  type        = string
}

variable "cluster_version" {
  description = "the cluster version"
  type        = string
  default     = "1.27"
}

variable "cluster_node_size" {
  description = "cluster node size"
  type        = number
  validation {
    condition     = var.cluster_node_size >= 1
    error_message = "The number of availibity zones must be greater or equal to 1"
  }
}

variable "role_arn" {
  type        = list(string)
  default     = []
}

variable "user_arn" {
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  type        = string
}

variable "vpc_private_subnets_id" {
  type        = list(string)
}

variable "vpc_private_subnets_cidr_blocks" {
  type        = list(string)
}

variable "az_coverage" {
  description = "Number of availability zones coverage, indicates also how many subnets"
  type        = number
  default     = 3
}