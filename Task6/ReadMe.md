# 

[Doc about Nodes/Agents](https://www.jenkins.io/doc/book/managing/nodes/)

# Task 6 (Jenkins)


## Install Jenkins in Ubuntu 

### Install Java(Jenkins requare)

Jenkins requare installed java. __Java version must be the same on agent and host__ Install it first:

`sudo apt-get update`

`sudo apt-get install openjdk-11-jre`

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

[Docker in jenkins container](https://faun.pub/how-to-install-docker-in-jenkins-container-4c49ba40b373)


## Fix  with "Got permission denied while trying to connect to the Docker daemon socket"

`sudo usermod -aG docker azureuser`
`sudo usermod -aG root azureuser`
`sudo chmod 777 /var/run/docker.sock`



## Fix bug with immidiatly stop container

Use root 
docker {
`args '--user 0'`
}

## Jenkins 

[Doc](https://www.jenkins.io/doc/pipeline)

[Build artifacts](https://www.youtube.com/watch?v=u6LF-T-daS4&ab_channel=CloudBeesTV)

[Build agents](https://www.youtube.com/watch?v=ymI02j-hqpU&ab_channel=CloudBeesTV)

[Use credentional(secret)](https://www.jenkins.io/doc/book/using/using-credentials/)





!!!!https://devopscube.com/docker-containers-as-build-slaves-jenkins/#Configure_a_Docker_Host_With_Remote_API_Important

https://habr.com/ru/post/481466/
https://www.jenkins.io/doc/book/pipeline/docker/

https://wiki.jenkins-ci.org/display/JENKINS/Distributed+builds





--https://piotrminkowski.com/2017/03/13/jenkins-nodes-on-docker-containers/#:~:text=Let%27s%20start%20from%20running%20Jenkins%20docker%20container.&text=Go%20to%20management%20console%20(http,new%20node%20on%20the%20list.


https://www.youtube.com/watch?v=ymI02j-hqpU&ab_channel=CloudBeesTV