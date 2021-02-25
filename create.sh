#!/bin/bash
# scp -i ~/.ssh/team-3codecool-com.pem docker-compose.yml ubuntu@35.159.19.190:

# Aniko
scp -i ~/.ssh/team2-week15.pem docker-compose.yml ubuntu@ec2-18-185-48-199.eu-central-1.compute.amazonaws.com:
ssh -i ~/.ssh/team2-week15.pem ubuntu@ec2-18-185-48-199.eu-central-1.compute.amazonaws.com '
sudo apt update;
sudo apt install docker.io -y;
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
sudo chmod +x /usr/local/bin/docker-compose;
sudo docker rm -f $(sudo docker ps -aq);
sudo docker-compose up -d wp;
sudo docker ps -a;
'

# Marian
scp -i ~/.ssh/team2-week15.pem docker-compose.yml ubuntu@ec2-54-93-202-151.eu-central-1.compute.amazonaws.com:
ssh -i ~/.ssh/team2-week15.pem ubuntu@ec2-54-93-202-151.eu-central-1.compute.amazonaws.com '
sudo apt update;
sudo apt install docker.io -y;
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
sudo chmod +x /usr/local/bin/docker-compose;
sudo docker rm -f $(sudo docker ps -aq);
sudo docker-compose up -d wp;
sudo docker ps -a;
'

# Marci
scp -i ~/.ssh/team2-week15.pem docker-compose.yml ubuntu@ec2-35-158-142-60.eu-central-1.compute.amazonaws.com:
ssh -i ~/.ssh/team2-week15.pem ubuntu@ec2-35-158-142-60.eu-central-1.compute.amazonaws.com '
sudo apt update;
sudo apt install docker.io -y;
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
sudo chmod +x /usr/local/bin/docker-compose;
sudo docker rm -f $(sudo docker ps -aq);
sudo docker-compose up -d wp;
sudo docker ps -a;
'

# Gabor
scp -i ~/.ssh/team2-week15.pem docker-compose.yml ubuntu@ec2-35-158-118-239.eu-central-1.compute.amazonaws.com:
ssh -i ~/.ssh/team2-week15.pem ubuntu@ec2-35-158-118-239.eu-central-1.compute.amazonaws.com '
sudo apt update;
sudo apt install docker.io -y;
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
sudo chmod +x /usr/local/bin/docker-compose;
sudo docker rm -f $(sudo docker ps -aq);
sudo docker-compose up -d wp;
sudo docker ps -a;
'
