variable "usernumber" {
  type = number
}

variable "elb_name" {
  type = string
}

variable "az" {
  type = list(any)
}


variable "timeout" {
  type = number
}

variable "types" {
  type = map(any)
  default = {
    us-east-1 = "t2.nano"
    us-west-1 = "t2.micro"
    us-west-2 = "t2.small"
  }
}

variable "list" {
  type    = list(any)
  default = ["m5.large", "m5.xlarge", "t2.medium"]
}