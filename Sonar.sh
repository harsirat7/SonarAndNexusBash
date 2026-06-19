#installing Tools
apt-get update -y
apt-get install -y openjdk-21-jdk
apt-get install -y git wget unzip

#creating user
sudo useradd -r -m -s /bin/bash sonarqube

#installing sonarqube
cd /opt
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-26.6.0.123539.zip
unzip sonarqube-26.6.0.123539.zip
rm -rf sonarqube-26.6.0.123539.zip
mv sonarqube-* sonarqube

#giving Permission to user
sudo chown -R sonarqube:sonarqube /opt/sonarqube
sudo chmod -R 775 /opt/sonarqube


#importing files
git clone https://github.com/harsirat7/SonarAndNexusBash.git
cd SonarAndNexusBash/
rm Sonar.sh
sed -i 's/\r$//' sysctl.conf
sed -i 's/\r$//' sonarqube.service
sed -i 's/\r$//' limits.conf

#moving file to /etc/
mv sysctl.conf /etc/
sysctl -p

#moving limits.conf
mv limits.conf /etc/security/limits.conf


#moving service file
mv sonarqube.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable sonarqube
sudo systemctl start sonarqube




