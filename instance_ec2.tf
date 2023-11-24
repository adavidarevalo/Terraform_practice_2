resource "aws_instance" "Server1" {
    ami = "ami-06d4b7182ac3480fa"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.Public_Subnet_1.id
    vpc_security_group_ids = [aws_security_group.route_allow_http_ssh.id]
    availability_zone = "us-east-2a"
    associate_public_ip_address = true
    private_ip = "192.168.10.10"
    key_name = aws_key_pair.sample_key_name.id
    depends_on =  [aws_internet_gateway.IG]
    user_data = file("userData.sh")
    tags = {
        Name = "Server1",
        Env = "dev"
    }
}

resource "aws_instance" "Server2" {
    ami = "ami-06d4b7182ac3480fa"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.Public_Subnet_2.id
    vpc_security_group_ids = [aws_security_group.route_allow_http_ssh.id]
    availability_zone = "us-east-2b"
    associate_public_ip_address = true
    private_ip = "192.168.20.11"
    key_name = aws_key_pair.sample_key_name.id
    depends_on =  [aws_internet_gateway.IG]
    user_data = file("userData2.sh")
    tags = {
        Name = "Server2",
        Env = "dev"
    }
}

resource "aws_instance" "Server3" {
    ami = "ami-06d4b7182ac3480fa"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.Public_Subnet_3.id
    vpc_security_group_ids = [aws_security_group.route_allow_http_ssh.id]
    availability_zone = "us-east-2c"
    associate_public_ip_address = true
    private_ip = "192.168.30.12"
    key_name = aws_key_pair.sample_key_name.id
    depends_on =  [aws_internet_gateway.IG]
    user_data = file("userData.sh")
    tags = {
        Name = "Server3",
        Env = "dev"
    }
}