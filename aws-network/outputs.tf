output "private_subnet_id" {
    value = aws_subnet.private_subnet[*].id
}

output "public_subnet_id" {
    value = aws_subnet.public_subnet[*].id
}

output "nat_eips" {
    value = aws_eip.nat_eip[*].public_ip
}