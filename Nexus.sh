# installing required Tools
apt-get update -y
apt-get install -y openjdk-21-jdk
apt-get install -y git wget unzip

# creating user 
sudo useradd -r -m -s /bin/bash nexus
