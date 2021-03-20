```bash
sudo yum update -y
sudo yum install git -y 

git clone https://github.com/markrity/vpn_jenkins.git

cd vpn_jenkins/jenkins

mkdir -p jenkins_home

sudo chown -R 1000:1000 jenkins_home

sudo amazon-linux-extras install docker -y
sudo usermod -a -G docker ec2-user
sudo service docker start

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose up -d
```

Access using `jenkins_ec2_instance_dns:8080`

Get admin pw from `jenkins_home/secrets/initialAdminPassword` 

In Jenkins settings:
Choose offered plugins.
Enter plugins , install Docker and Docker pipeline plugins.

Perform a restart for Jenkins.


Create new Build -> Pipeline, select `GitHub hook trigger for GITScm polling` checkbox , 
At Pipeline choose from `Pipeline script from SCM` and configure it to be on `main` branch and `Script Path` from `jenkins/Jenkinsfile`.


Upcomming configuration:
* Add docker hub credentials.
* Add webhook for this repo to auto trigger build that uses Jenkinsfile. (added in repo , need a successful trigger before polling starts working.)
* Finish deployment process.