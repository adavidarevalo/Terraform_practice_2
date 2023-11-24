output "elb_dns_name" {
    value = aws_elb.myElb.dns_name
}

output "server1_ip" {
    value = aws_instance.Server1.private_ip
}

# output "server1_eip" {
#     value = aws_eip.default.public_ip
# }

output "server1_eip" {
    value = aws_eip.one.public_ip
}