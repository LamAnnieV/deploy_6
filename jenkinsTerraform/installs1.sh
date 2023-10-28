#!/bin/bash

exec > >(tee -a /var/log/user-data.log) 2>&1

echo "Script started at: $(date)"


#Install Java

sudo apt update && sudo apt install -y openjdk-11-jre

#Install Jenkins

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y

# Start Jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins >> ~/Status.txt

# Dependencies
sudo apt install -y software-properties-common
echo | sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get install -y python3.7
sudo apt-get install -y python3.7-venv
sudo apt-get install -y build-essential
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y python3.7-dev

# add user to sudo group
sudo usermod -aG sudo jenkins
sudo su - jenkins

#generate an RSA SSH key pair
ssh-keygen -t rsa -N "" -f /var/lib/jenkins/.ssh/id_rsa

# read, write, and execute
chmod 700 /var/lib/jenkins/.ssh/id_rsa

#read and write
chmod 600 /var/lib/jenkins/.ssh/id_rsa

echo "Script completed at: $(date)"

exit 0
