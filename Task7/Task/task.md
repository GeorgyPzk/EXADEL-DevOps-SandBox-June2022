https://docs.google.com/document/d/1ziWxQMEvBxk1uUlUcorynlw-QgBk60nAf6U42wBSiHA/edit

# Task 7: Logging & Monitoring

Tasks:
1. Zabbix:
Big brother is watching  ....
1.1 Install on server, configure web and base
1.2 Prepare VM or instances. 
1.2.1 Install Zabbix agents on previously prepared servers or VM.
EXTRA 1.2.2: Complete 1.2.1 using ansible
1.3 Make several of your own dashboards, where to output data from your host/vm/container (one of them)
1.4 Active check vs passive check - use both types.
1.5 Make an agentless check of any resource (ICMP ping)
1.6 Provoke an alert - and create a Maintenance instruction
1.7 Set up a dashboard with infrastructure nodes and monitoring of hosts and software installed on them


2. ELK:
Nobody is forgotten and nothing is forgotten.
2.1 Install and configure ELK
2.2 Organize collection of logs from docker to ELK and receive data from running containers
2.3 Customize your dashboards in ELK
EXTRA 2.4: Set up filters on the Logstash side (get separate docker_container and docker_image fields from the message field)
Replaced to:
(do this) EXTRA 2.4: Set up filter (get log messages from container by docker container name or docker image fields)*
2.5 Configure monitoring in ELK, get metrics from your running containers
2.6 Study features and settings

3. Grafana:
3.1 Install Grafana
3.2 Integrate with installed ELK
3.3 Set up Dashboards
3.4 Study features and settings
