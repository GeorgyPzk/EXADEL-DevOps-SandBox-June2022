# Task 6 (Jenkins)


## Install Jenkins in Ubuntu 

### Install Java(Jenkins requare)

Jenkins requare installed java. Install it first:

`sudo apt-get update`

`sudo apt-get install openjdk-8-jre`

`java -version`

### Install Jenkins

Write this:
(Don't write \ at the and of string.)

`curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \`
  `/usr/share/keyrings/jenkins-keyring.asc > /dev/null`

`echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \`
  `https://pkg.jenkins.io/debian-stable binary/ | sudo tee \`
  `/etc/apt/sources.list.d/jenkins.list > /dev/null`

`sudo apt-get update`

`sudo apt-get install jenkins`

`sudo service jenkins status`

[Install Jenkins](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu)

## Set up Jenkins

1. __Open port 8080__ and you can see and work with jenkins using a web application. 
2. To start configure go to 52.157.178.5:8080.
3. To find password use this command:
`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
4. Insall plagins and set up user.
Jenkins URL: http://52.157.178.5:8080/

## Сreating an agent in a container on the host VM

### Install docker 

Use command from task 4 :)

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`

`sudo apt install docker-ce`

## Deploy container with Jenkins

Install docker firstly

`sudo docker run -d -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts`

Then set up Jenkins

## Deploy container with Docker