# resource "aws_eip" "default" {
#   instance = aws_instance.Server1.id
#   tags = {
#     Name = "terraform-aws-eip"
#   }
# }

resource "aws_eip" "one" {
  
}

resource "aws_eip" "two" {
    
}

resource "aws_eip_association" "eip_server1" {
    instance_id = aws_instance.Server1.id
    allocation_id = aws_eip.one.id 
}

resource "aws_eip_association" "eip_server2" {
    instance_id = aws_instance.Server2.id
    allocation_id = aws_eip.two.id 
}