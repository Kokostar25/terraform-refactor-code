cidr              = "10.0.0.0/16"
cidr_pubsubnet    = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
cidr_prvsubnet    = ["10.0.64.0/20", "10.0.80.0/20", "10.0.96.0/20"]
availability_zone = ["us-east-1a", "us-east-1b"]

// security_rules = {
//   masterclass-bastion-sg = {
//     "rule1" = { type = "ingress", from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH", security_group_ids = ["aws_security_group.bastion-sg.id"] },
//     "rule2" = { type = "ingress", from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["73.136.30.160"], description = "For SSH", security_group_ids = ["aws_security_group.bastion-sg.id"] },
//     // "rule3" = { type = "egress", from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "FOR OUTBOUND", }
//   }

//   masterclass-ext-alb-sg = {
//     "rule1" = { type = "ingress", from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "to_allow_all_ingress_port80", security_group_ids = ["aws_security_group.ext-alb-sg.id"] },
//     // "rule2" = { type = "egress", from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "FOR OUTBOUND" }
//   }

//   masterclass-nginx-sg = {
//     "rule1" = { type = "ingress", from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["null"],description = "for_inbound-bastion-ssh-to-nginx", security_group_ids = ["aws_security_group.nginx-sg.id"]},
//     "rule2" = { type = "ingress", from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["null"],description = "for_inbound-nginx-http", security_group_ids = ["aws_security_group.nginx-sg.id"] },
//     "rule3" = { type = "ingress", from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["null"],description = "for_inbound-nginx-https", security_group_ids = ["aws_security_group.nginx-sg.id"] },
//     // "rule4" = { type = "egress", from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "FOR OUTBOUND" }
//   }
// } 