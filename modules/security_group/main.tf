// locals {
//   project_name = "${var.project_prefix}"
// }


# security group for alb, to allow acess from any where for HTTP and HTTPS traffic
resource "aws_security_group" "ext-alb-sg" {
  name        = "masterclass-ext-alb-sg"
  vpc_id      = var.vpc_id_from_networksmodule
  description = "External ALB SG"


  tags = {
    Name            = "masterclass-ext-alb-sg"
  }

}

# security group for alb, to allow acess from any where for HTTP and HTTPS traffic
resource "aws_security_group" "nginx-sg" {
  name        = "masterclass-nginx-sg"
  vpc_id      = var.vpc_id_from_networksmodule
  description = "Nginx SG"


  tags = {
    Name            = "masterclass-nginx-sg"
  }

}

# security group for alb, to allow acess from any where for HTTP and HTTPS traffic
resource "aws_security_group" "bastion-sg" {
  name        = "masterclass-bastion-sg"
  // name        = "masterclass-sg"
  vpc_id      = var.vpc_id_from_networksmodule
  description = "Bastion SG"


  tags = {
    Name            = "masterclass-bastion-sg"
  }

}


 # security group for alb, to allow acess from any where for HTTP and HTTPS traffic
resource "aws_security_group" "int-alb-sg" {
  name        = "masterclass-int-alb-sg"
  vpc_id      = var.vpc_id_from_networksmodule
  description = "Internal SG ALB"


  tags = {
    Name            = "masterclass-int-alb-sg"
  }

}

# security group for alb, to allow acess from any where for HTTP and HTTPS traffic
resource "aws_security_group" "tooling-sg" {
  name        = "masterclass-tooling-sg"
  vpc_id      = var.vpc_id_from_networksmodule
  description = "tooling SG"


  tags = {
    Name            = "masterclass-tooling-sg"
  }

}

# security group for alb, to allow acess from any where for HTTP and HTTPS traffic
resource "aws_security_group" "wordpress-sg" {
  name        = "masterclass-wordpress-sg"
  vpc_id      = var.vpc_id_from_networksmodule
  description = "wordpress SG"


  tags = {
    Name            = "masterclass-wordpress-sg"
  }

}

# security group for alb, to allow acess from any where for HTTP and HTTPS traffic
resource "aws_security_group" "datalayer-sg" {
  name        = "masterclass-ext-data-layer-sg"
  vpc_id      = var.vpc_id_from_networksmodule
  description = "Datalayer SG"


  tags = {
    Name            = "masterclass-ext-data-layer-sg"
  }

}
