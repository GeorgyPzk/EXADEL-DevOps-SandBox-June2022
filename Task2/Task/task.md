https://docs.google.com/document/d/1SGgzEIJ0saeZY7HdWQxkKYEm-zsUelyD_dLY736yM1c/edit#

# Task 2b: Azure Cloud
 
Important moments:
1. Read about Cloud Services. Pros and Cons, Cloud VS Bare Metal infrastructure?
2. Read about Resource Groups and Regions in Azure. What are they for? Which one will you use and why?
3. Read about Security best practices in IAM.
4. Read about Azure VM, what is it, what is it useful for?
5. Read about Azure Virtual Network (NSG, Routes, Internet Gateways).
6. Read about Azure Storage Account, Azure DNS Service, Azure CDN, Azure Monitor.
If you sign up in Azure for the first time, you will have the opportunity to use Azure Free Account. Please, check this link https://azure.microsoft.com/en-us/free/
To register, you need a credit card from which it will be debited and returned 1-2$.
 
Tasks:
1. Sign up for Microsoft Azure, familiarize yourself with the basic elements of the Azure console GUI.
2. PAY ATTENTION! Azure Billing and current costs and Azure services what you use.
3. Create two VM Instances with different operating systems (Linux / Ubuntu / ...). Try to stop them, restart, delete, recreate.
4. Make sure there is an SSH connection from your host to the created VM. What VM IP used for it?
5. Make sure  ping and SSH are allowed from one VM to another in both ways. Configure SSH connectivity between VMs using SSH keys.
6. Install web server (nginx/apache) to one instance;
    - Create a web page with the text “Hello World” and additional information about OS version, free disk space,  free/used memory in the system and about all running processes;
    - Make sure your web server is accessible from the internet and you can see your web page in your browser;
    - Make sure on the instance without nginx/apache you also maysee the content of your webpage from instance with nginx/apache.

## EXTRA (optional): : 
1. Run steps 3-6 with VMs created in different Virtual Networks. (connectivity must be both external and internal IP).    
2. Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
 
EXTRA (optional optional):
1. Make a screenshot only of your web page сontent from your browser.
2. Create your Storage Account and place your screenshot there.
3. Make your screenshot visible (public) on the internet for everyone and make sure it works.
 
As a result of this task should be a link in your github on the your “Hello World” web page. After task check by your mentor, the instance may be deleted. EXTRA tasks are passed to mentors individually.
