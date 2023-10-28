################## D E C L A R E - V A R I A B L E ####################

################################### A W S - R E G I O N # 1 #################################

variable "aws_access_key" {}
variable "aws_secret_key" {}
#variable "region_1" {}

################################### V P C # 1  #################################

variable "aws_vpc_1_name" {}
variable "cidr_block_1" {}

################################### S U B N E T # 1 #################################

variable "availability_zone_1" {}
variable "aws_subnet_1_name" {}
variable "subnet_1_cidr_block" {}


################################### S U B N E T # 2 #################################

variable "availability_zone_2" {}
variable "aws_subnet_2_name" {}
variable "subnet_2_cidr_block" {}

###################### I N T E R N E T - G A T E W A Y # 1 #################################

variable "aws_igw_1_name" {}

###################### R O U T E - T A B L E # 1 #################################

variable "aws_rt_1_name" {} 

################################### I N S T A N C E # 1 #################################

variable "ami_region_1" {}
variable "instance_type_1" {}
variable "instance_1_installs" {}
variable "key_pair_1" {}
variable "aws_instance_1_name" {}

################################### I N S T A N C E # 2 #################################
  
variable "instance_type_2" {}
variable "instance_2_installs" {}
variable "aws_instance_2_name" {}


####################### S E C U R I T Y - G R O U P # 1 ##############################

variable "aws_sg_1_name" {}
variable "sg_1_description" {}

################################### A W S - R E G I O N # 2 #################################


################################### V P C # 2  #################################

variable "aws_vpc_2_name" {}
variable "cidr_block_2" {}

################################### S U B N E T # 3 #################################

variable "availability_zone_3" {}
variable "aws_subnet_3_name" {}
variable "subnet_3_cidr_block" {}


################################### S U B N E T # 4 #################################

variable "availability_zone_4" {}
variable "aws_subnet_4_name" {}
variable "subnet_4_cidr_block" {}

###################### I N T E R N E T - G A T E W A Y # 2 #################################

variable "aws_igw_2_name" {}

###################### R O U T E - T A B L E # 2 #################################

variable "aws_rt_2_name" {} 

################################### I N S T A N C E # 3 #################################

variable "ami_region_2" {}
variable "instance_type_3" {}
variable "instance_3_installs" {}
variable "key_pair_2" {}
variable "aws_instance_3_name" {}

################################### I N S T A N C E # 4 #################################
  
variable "instance_type_4" {}
variable "instance_4_installs" {}
variable "aws_instance_4_name" {}


####################### S E C U R I T Y - G R O U P # 2 ##############################

variable "aws_sg_2_name" {}
variable "sg_2_description" {}
