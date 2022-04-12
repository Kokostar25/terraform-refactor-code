variable "cidr" {
  type = string

}

variable "cidr_pubsubnet" {
  type        = list(string)
  description = "this is a variable with value for PubSubnet_cidr in networks module"
}

variable "cidr_prvsubnet" {
  type        = list(string)
  description = "this is a variable with value for PrvSubnet_cidr in networks module"
}


// variable "region" {
//   type    = string
//   default = "us-east-1"
// }

variable "availability_zone" {
  type = list(string)

}

// variable "security_rules" {

//   type = map(map(object({
//     type        = string
//     description = string
//     from_port   = number
//     to_port     = number
//     protocol    = string
//     cidr_blocks = list(string)
//     security_group_ids = list(string)
//     // source_security_group_id = list(string)

//   })))

// }

// variable "secgroups" {
//   type = map(map(map(object({
//         ports_min         = list(number)
//         ports_max         = list(number)
//         security_group_id = list(string)
//       }))))
// }