#!/bin/bash

#Install Java

sudo apt update && sudo apt install -y openjdk-11-jre

#Install Jenkins

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y

# Install Terraform
sudo apt update
sudo apt-get install terraform -y

# Start Jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins >> ~/Status.txt

exit 0
