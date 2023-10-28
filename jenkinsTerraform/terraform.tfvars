################################### A W S #################################

access_key = ""
secret_key = ""
region = "us-east-1"


################################### I N S T A N C E # 1 #################################

ami = "ami-08c40ec9ead489470"
instance_type_1 = "t2.micro"

                           
instance_1_attach_existing_subnet = "subnet-0393a22de08121e20"  #cannot use.id here
instance_1_existing_sg = ["sg-051970118bf6a4bef"] #for existing security group
#instance_1_new_sg = 3need to test
instance_1_installs = "installs1.sh"
key_pair = "D6_key_pair"
aws_instance_1_name = "D6_jenkins"

################################### I N S T A N C E # 2 #################################variable "ami" {}

instance_type_2 = "t2.micro"
instance_2_attach_existing_subnet = "subnet-0393a22de08121e20"  #cannot use.id here
instance_2_installs = "installs2.sh"
aws_instance_2_name = "D6_terraform"
