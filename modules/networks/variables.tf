variable "cidr_block" {
    type = string
    
}
variable "PubSubnet_cidr" {
    type = list(string)
    
}

variable "PrvSubnet_cidr" {
    type = list(string)
  

}

variable "availability_zone" {
    type = list (string)
    
}

variable "project_prefix" {
  type = string
  default = "Project15"
}