module "networking" {
  source            = "./modules/networks"
  cidr_block        = var.cidr
  PubSubnet_cidr    = var.cidr_pubsubnet
  PrvSubnet_cidr    = var.cidr_prvsubnet
  availability_zone = var.availability_zone

}

module "sg" {
  source                      = "./modules/security_group"
  vpc_id_from_networksmodule  = module.networking.vpc_id_module
  

}


// locals {
//   flat_security_rules = merge([
//     for sg, rules in var.security_rules :
//     {
//       for rule, vals in rules :
//       "${sg}-${rule}" => merge(vals, { sg_name = sg })
//     }
//   ]...) # please, do NOT remove the dots
// }
// resource "aws_security_group_rule" "rules" {
//   for_each          = local.flat_security_rules
//   type              = each.value.type
//   from_port         = each.value.from_port
//   to_port           = each.value.to_port
//   protocol          = each.value.protocol
//   cidr_blocks       = each.value.cidr_blocks
//   description       = each.value.description
//   security_group_ids = ["module.sg.masterclass_security_group","module.sg.external-alb-sg","module.sg.nginx-sg"]
//   // source_security_group_id = module.sg[each.key].masterclass_security_group

// }









