variable "app" {
  type        = string
  description = "The name of the application or project that the stack supports"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "The target environment for the stack - could be a tier or account level reference"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "demo", "perf", "nonprod", "prod"], var.env)
    error_message = "Must be one of the following: dev, qa, stage, prod, demo, perf,nonprod, prod"
  }
}

variable "firehose_arn" {
  type        = string
  description = ""
  sensitive   = false
}

variable "namespace" {
  type      = set(string)
  default   = ["AWS/ES", "AWS/ApplicationELB"]
  sensitive = false
}

variable "output_format" {
  type      = string
  default   = "opentelemetry0.7"
  sensitive = false
}

variable "program" {
  type        = string
  description = "The name of the program that the application or project belongs to"
  sensitive   = false
}

variable "role_arn" {
  type        = string
  description = ""
  sensitive   = false
}
