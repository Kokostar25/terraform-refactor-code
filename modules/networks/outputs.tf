output "vpc_id_module" {
    value = aws_vpc.dp_vpc.id
}
output "Pub_Subnet_id_module" {
    value = aws_subnet.dp_Pub-Subnet.*.id
}
output "Prv_Subnet_id_module" {
    value = aws_subnet.dp_Prv-Subnet.*.id
}
