variable "project_name" {
  default = ""
}

variable "region" {
  default = "us-west1-a"
}

variable "tags" {
  type = list(string)
  default = [""]
}

variable "application" {
  default = ""
}

variable "disk_size" {
  default = 50
}

variable "image" {
  default = ""
}

variable "metadata" {
  type = map(string)
  default = {}
}

variable "machine_type" {
  default = ""
}