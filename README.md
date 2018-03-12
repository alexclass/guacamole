# Apache Guacamole

Apache Guacamole is a clientless remote desktop gateway. It supports standard protocols like SSC, Telnet, VNC, and RDP. It is open source and requires no plugins or client software installed. Thanks to HTML5, once Guacamole is installed on a server, all you need to access your remote desktops and servers is a web browser.

Since Guacamole is accessed via your web browser, you can install Guacamole on a Cloud Service Provider (e.g. Microsoft, Amazon, or Google) and access Guacamole through your corporate proxy server. This can enable you to remotley access your Cloud hosted virtual machines without having to configure Firewall Rules or establish a Virtual Private Network.

## Preface

When the need for a "jump server" arose, I deployed the <a href="https://github.com/Azure/azure-quickstart-templates/tree/master/guacamole-rdp-vnc-gateway-existing-vnet">Apache Guacamole Azure Quick Start Template</a>. This template was a great introduction to Apache Guacamole. However, it leveraged multiple Docker images, and I wasn't certian what other software resided within these containers. The magic behind this template came from a base64 encoded custom data <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/linux/using-cloud-init">Cloud-Init</a> script, which didn't lend intself to my intention of sharing this template and allowing people to easily specify their desired database password and configuration. Since the skills required to develop ARM templates are required to obtain MCSE: Cloud Platform and Infrastructure certification, and that I needed to deploy Apache Guacamole, the challenge was on to develop an ARM template that could be reused and was configurable.

## Getting Started

These instructions will get you up and running with Apache Guacamole in no time at all.

### Prerequisites

| Parameter                 | Description  |
| :-------------------------|:-------------|
| vm Name                   | Define the name of your Apache Guacamole Virtual Machine. |
| vm DNS Prefix             | Define the DNS prefix for the assigned the Public IP address. </br></br>Note</br> This field must be lowercase and should match the following regular expression: ^[a-z][a-z0-9-]{1,61}[a-z0-9]$ or it will raise an error. |
| vm Size                   | Define the Compute instance size (e.g. Standard_A2_v2). |
| vm Username               | Define the Apache Guacamole Virtual Machine Administrator username.|
| vm SSH Public Key         | Define the SSH Public Key that will be used for SSH authentication.</br></br>Note</br> You can leverage ssh-keygen (Linux) or PuttyGen (Windows) to generate this.|
| vm Vnet Name              | Define the name of an existing Virtual Network Name.|
| vm Vnet RG                | Define the name of the Resource Group where your Virtual Network resides.|
| vm Subnet Name            | Define the name of an existing Subnet within your Virtual Network.|
| vm mysql Root Pwd         | Define your desired mySQL root password.|
| vm guac DB Pwd            | Define your desired Guacamole database password.|
| vm cert Email Address     | Define your email address to be used with the generation of your Let's Encrypt SSL certificate.|
| vm Username               | A public http(s) uri that points to a script action that will install act as an entry point for nginx-install.sh and guac-install.sh.|
| vm Username               | A public http(s) uri that points to a script action that will install Nginx and a Let's Encrypt SSL|
| vm Username               | A public http(s) uri that points to a script action that will install Apache Guacamole.|

## Deploy to Azure

The following will occur as part of the deployment to Microsoft Azure:
* Creation of a Ubuntu 16.04 virtual machine
* Creation of a Public IP address with your specified DNS prefix
* Creation of a Network Security Group that allows incoming traffic on ports 22, 80, 443.
  * Ports 8080 and 8443 are proxied via the Nginx server to Tomcat thus they are not required to be open.
* Installion of Nginx, Tomcat, MySQL, Guacamole, and a Let's Encrypt SSL certificate

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbigredthelogger%2Fguacamole%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fbigredthelogger%2Fguacamole%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Lessons Learned

### 1. Custom Script Extensions 

Custom Script Extensions download and runs scripts on Azure virtual machines. These are useful for post-deployment configuration, software installation, or any other configuration/management task. You can download scripts from Azure Storage or another accessible internet location, or even provide them to the extension at runtime.
```
Tip: Only a single Custom Script Extension can be assigned to an Azure virtual machine.
Option 1: Create a single script that executes all your desired commands or
Option 2: Create an entry point script (reference install.sh in this project) that executes your individual scripts.
```
References
* <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/windows/extensions-customscript">Custom Script Extension for Windows</a>
* <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/linux/extensions-customscript">Custom Script Extension for Linux</a>

### 2. Network Security Groups

Be very careful when you want to apply Network Security Groups to both a Azure virtual machine NIC and the subnet at the same time: NSGs are evaluated independently, and an "allow" rule must exist at both levels, otherwise traffic will not be admitted.

References
* <a href="https://blogs.msdn.microsoft.com/igorpag/2016/05/14/azure-network-security-groups-nsg-best-practices-and-lessons-learned/">Azure Network Security Groups (NSG) – Best Practices and Lessons Learned</a>

### 3. Azure Resource Manager (ARM) Templates

You can inject a script or other metadata into a Microsoft Azure virtual machine at provision time using a feature called custom data. Custom data needs to be base64-encoded and can contain data such as variables, parameters, scripts, or even cloud-init syntax.

You can use cloud-init to install packages and write files, or to configure users and security on select Linux images (e.g. Ubuntu, CoreOS, and RHEL).

References
* <a href="https://azure.microsoft.com/en-us/blog/custom-data-and-cloud-init-on-windows-azure/">Custom Data and Cloud-Init on Microsoft Azure</a>
* <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/linux/using-cloud-init">Cloud-init support for virtual machines in Azure</a>
* <a href="https://help.ubuntu.com/community/CloudInit">CloudInit Official Documentation</a>
* <a href="https://github.com/Azure/azure-quickstart-templates/blob/master/1-CONTRIBUTION-GUIDE/best-practices.md">Azure Resource Manager QuickStart Templates</a>

## Acknowledgments

* <a href="https://github.com/Azure/azure-quickstart-templates/tree/master/guacamole-rdp-vnc-gateway-existing-vnet">Azure Quickstart Templates</a>
* <a href="https://github.com/MysticRyuujin/guac-install">Chase Wright</a>
