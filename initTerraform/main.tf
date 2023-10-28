

################################### A W S - R E G I O N # 1 #################################

# configure aws provider for us-east-1
provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

################################### V P C # 1 #################################
# Create VPC
resource "aws_vpc" "tf_local_vpc_1" {
  provider = aws
  cidr_block = var.cidr_block_1
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = var.aws_vpc_1_name
  }
}

################################### S U B N E T # 1 #################################
# Create a subnet_1 within the VPC
resource "aws_subnet" "tf_local_subnet_1" {
  vpc_id = aws_vpc.tf_local_vpc_1.id
  cidr_block = var.subnet_1_cidr_block
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true

  tags      = {
    Name    = var.aws_subnet_1_name
  }
}


################################### S U B N E T # 2 #################################

resource "aws_subnet" "tf_local_subnet_2" {
  vpc_id                  = aws_vpc.tf_local_vpc_1.id
  cidr_block              = var.subnet_2_cidr_block
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags      = {
    Name    = var.aws_subnet_2_name
  }
}



###################### I N T E R N E T - G A T E W A Y # 1 #################################
resource "aws_internet_gateway" "tf_local_igw_1" {
  vpc_id = aws_vpc.tf_local_vpc_1.id
  tags = {
    Name = var.aws_igw_1_name
  }
}

###################### D E F A U L T - R O U T E - T A B L E # 1 #################################


resource "aws_default_route_table" "tf_local_def_rt_1" {
  default_route_table_id = aws_vpc.tf_local_vpc_1.default_route_table_id
  tags = {
    Name = var.aws_rt_1_name
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_local_igw_1.id
  }
}

################################### I N S T A N C E # 1 #################################

# create instance  #Resource Block to create an AWS instance

resource "aws_instance" "tf_local_instance_1" {
  ami = var.ami_region_1                            #AMI ID for Ubuntu
  instance_type = var.instance_type_1
  subnet_id = aws_subnet.tf_local_subnet_1.id #var.instance_1_attach_existing_subnet
  
  #security_groups = var.instance_1_existing_sg  #existing sg #error delete
  vpc_security_group_ids = [aws_security_group.tf_local_security_group_1.id]  #var.instance_1_existing_sg
 
  user_data = "${file(var.instance_1_installs)}"
  key_name = var.key_pair_1          # name of your SSH key pair
  associate_public_ip_address = true  # Enable Auto-assign public IP

  tags = {
    "Name" : var.aws_instance_1_name     #name of the instance in AWS
  }
}


################################### I N S T A N C E # 2 #################################

resource "aws_instance" "tf_local_instance_2" {
  ami = var.ami_region_1                           #AMI ID for Ubuntu
  instance_type = var.instance_type_2
  subnet_id = aws_subnet.tf_local_subnet_2.id   #var.instance_2_attach_existing_subnet
  
  #security_groups = var.instance_1_existing_sg  #existing sg #error delete
  vpc_security_group_ids = [aws_security_group.tf_local_security_group_1.id]  #var.instance_2_existing_sg

  user_data = "${file(var.instance_2_installs)}"
  key_name = var.key_pair_1          # name of your SSH key pair
  associate_public_ip_address = true  # Enable Auto-assign public IP

  tags = {
    "Name" : var.aws_instance_2_name   #name of the instance in AWS
  }
}


####################### S E C U R I T Y - G R O U P # 1 ##############################

resource "aws_security_group" "tf_local_security_group_1" {      
  name        = var.aws_sg_1_name                   
  description = var.sg_1_description
  vpc_id = aws_vpc.tf_local_vpc_1.id

#Ingress is for Inbound rules/ports
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Egress is for Outbound rules/ports
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" : var.aws_sg_1_name
    "Terraform" : "true"
  }
}


# ################################### O U T P U T #################################

 output "instance_1_ip" {            
   value = aws_instance.tf_local_instance_1.public_ip
 }
 output "instance_2_ip" {            
   value = aws_instance.tf_local_instance_2.public_ip
 }

 ################################### A W S - R E G I O N # 2  #################################

provider "aws" {
  alias      = "west"
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

}

################################### V P C # 2 #################################
resource "aws_vpc" "tf_local_vpc_2" {
  provider = aws.west
  cidr_block = var.cidr_block_2
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = var.aws_vpc_2_name
  }
}


################################### S U B N E T # 3 #################################

resource "aws_subnet" "tf_local_subnet_3" {
  provider = aws.west
  vpc_id = aws_vpc.tf_local_vpc_2.id
  cidr_block = var.subnet_3_cidr_block
  availability_zone = var.availability_zone_3
  map_public_ip_on_launch = true

  tags      = {
    Name    = var.aws_subnet_3_name
  }
}


################################### S U B N E T # 4 #################################

resource "aws_subnet" "tf_local_subnet_4" {
  provider = aws.west
  vpc_id                  = aws_vpc.tf_local_vpc_2.id
  cidr_block              = var.subnet_4_cidr_block
  availability_zone       = var.availability_zone_4
  map_public_ip_on_launch = true

  tags      = {
    Name    = var.aws_subnet_4_name
  }
}



###################### I N T E R N E T - G A T E W A Y # 2 #################################
resource "aws_internet_gateway" "tf_local_igw_2" {
  provider = aws.west
  vpc_id = aws_vpc.tf_local_vpc_2.id
  tags = {
    Name = var.aws_igw_2_name
  }
}



###################### D E F A U L T - R O U T E - T A B L E # 2 #################################


resource "aws_default_route_table" "tf_local_def_rt_2" {
  provider = aws.west
  default_route_table_id = aws_vpc.tf_local_vpc_2.default_route_table_id
  tags = {
    Name = var.aws_rt_2_name
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_local_igw_2.id
  }
}



################################### I N S T A N C E # 3 #################################

resource "aws_instance" "tf_local_instance_3" {
  provider = aws.west
  ami = var.ami_region_2                            
  instance_type = var.instance_type_2
  subnet_id = aws_subnet.tf_local_subnet_3.id #var.instance_1_attach_existing_subnet
  
  vpc_security_group_ids = [aws_security_group.tf_local_security_group_2.id]  #var.instance_1_existing_sg
 
  user_data = "${file(var.instance_3_installs)}"
  key_name = var.key_pair_2          # name of your SSH key pair
  associate_public_ip_address = true  # Enable Auto-assign public IP

  tags = {
    "Name" : var.aws_instance_3_name     #name of the instance in AWS
  }
}


################################### I N S T A N C E # 4 #################################

resource "aws_instance" "tf_local_instance_4" {
  provider = aws.west
  ami = var.ami_region_2                          
  instance_type = var.instance_type_2
  subnet_id = aws_subnet.tf_local_subnet_4.id   #var.instance_2_attach_existing_subnet
  
  #security_groups = var.instance_1_existing_sg  #existing sg #error delete
  vpc_security_group_ids = [aws_security_group.tf_local_security_group_2.id]  #var.instance_2_existing_sg

  user_data = "${file(var.instance_4_installs)}"
  key_name = var.key_pair_2          # name of your SSH key pair
  associate_public_ip_address = true  # Enable Auto-assign public IP

  tags = {
    "Name" : var.aws_instance_4_name   #name of the instance in AWS
  }
}

####################### S E C U R I T Y - G R O U P # 2 ##############################

resource "aws_security_group" "tf_local_security_group_2" {      
  name        = var.aws_sg_2_name                   
  description = var.sg_2_description
  vpc_id = aws_vpc.tf_local_vpc_2.id
  provider = aws.west

#Ingress is for Inbound rules/ports
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Egress is for Outbound rules/ports
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" : var.aws_sg_1_name
    "Terraform" : "true"
  }
}

# ################################### O U T P U T # 2 #################################

 output "instance_3_ip" {            
   value = aws_instance.tf_local_instance_3.public_ip
 }
 output "instance_4_ip" {            
   value = aws_instance.tf_local_instance_4.public_ip
 }
