output "bastion-sg" {
    value = aws_security_group.bastion-sg.id
}
output "external-alb-sg" {
    value = aws_security_group.ext-alb-sg.id
}
output "int-alb-sg" {
    value = aws_security_group.int-alb-sg.id
}
output "nginx-sg" {
    value = aws_security_group.nginx-sg.id
}

output "tooling-sg" {
    value = aws_security_group.tooling-sg.id
}
output "wordpress-sg" {
    value = aws_security_group.wordpress-sg.id
}
output "datalayer-sg" {
    value = aws_security_group.datalayer-sg.id
}

// output "masterclass_security_group" {
//     value = {for k, v in aws_security_group.ec2_security_groups: k => v.id}
// }