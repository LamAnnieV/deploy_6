################################### A W S - R E G I O N # 1 #################################

aws_access_key = ""
aws_secret_key = ""
#region_1 = "us-east-1"

################################### V P C # 1 #################################

aws_vpc_1_name = "D6-vpc-east"
cidr_block_1 = "172.30.0.0/16"

################################### S U B N E T # 1 #################################

availability_zone_1 = "us-east-1b"
aws_subnet_1_name = "D6_publicSubnet01_east"
subnet_1_cidr_block = "172.30.0.0/18"

################################### S U B N E T # 2 #################################

availability_zone_2 = "us-east-1c"
aws_subnet_2_name = "D6_publicSubnet02_east"
subnet_2_cidr_block = "172.30.128.0/18"

###################### I N T E R N E T - G A T E W A Y # 1 #################################

aws_igw_1_name = "D6_igw_east"

###################### R O U T E - T A B L E # 2 #################################

aws_rt_1_name = "D6_rt_public_east"

################################### I N S T A N C E # 1 #################################

ami_region_1 = "ami-08c40ec9ead489470"
instance_type_1 = "t2.micro"

instance_1_installs = "deploy.sh"
key_pair_1 = "AnnieLam874key"
aws_instance_1_name = "D6_applicationServer01_east"

################################### I N S T A N C E # 2 #################################

instance_type_2 = "t2.micro"
instance_2_installs = "deploy.sh"
aws_instance_2_name = "D6_applicationServer02_east"

####################### S E C U R I T Y - G R O U P # 1 ##############################

aws_sg_1_name = "D6_sg_SSH_Web_Server_east"
sg_1_description = "D6_sg_SSH_Web_Server_east"

################################### A W S - R E G I O N # 2 #################################




################################### V P C # 2 #################################

aws_vpc_2_name = "D6-vpc-west"
cidr_block_2 = "172.31.0.0/16"

################################### S U B N E T # 3 #################################

availability_zone_3 = "us-west-2a"
aws_subnet_3_name = "D6_publicSubnet01_west"
subnet_3_cidr_block = "172.31.0.0/18"

################################### S U B N E T # 4 #################################

availability_zone_4 = "us-west-2b"
aws_subnet_4_name = "D6_publicSubnet02_west"
subnet_4_cidr_block = "172.31.128.0/18"

###################### I N T E R N E T - G A T E W A Y # 2 #################################

aws_igw_2_name = "D6_igw_west"

###################### R O U T E - T A B L E # 2 #################################

aws_rt_2_name = "D6_rt_public_west"

################################### I N S T A N C E # 3 #################################

ami_region_2 = "ami-0efcece6bed30fd98"
instance_type_3 = "t2.micro"
instance_3_installs = "deploy.sh"
key_pair_2 = "D6_key_pair_west"
aws_instance_3_name = "D6_applicationServer01_west"

################################### I N S T A N C E # 4 #################################

instance_type_4 = "t2.micro"
instance_4_installs = "deploy.sh"
aws_instance_4_name = "D6_applicationServer02_west"

####################### S E C U R I T Y - G R O U P # 2 ##############################

aws_sg_2_name = "D6_sg_SSH_Web_Server_west"
sg_2_description = "D6_sg_SSH_Web_Server_west"
