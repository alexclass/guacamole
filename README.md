# Apache Guacamole

Apache Guacamole is a clientless remote desktop gateway. It supports standard protocols like SSC, Telnet, VNC, and RDP. It is open source and requires no plugins or client software installed. Thanks to HTML5, once Guacamole is installed on a server, all you need to access your remote desktops and servers is a web browser.

Since Guacamole is accessed via your web browser, you can install Guacamole on a Cloud Service Provider (e.g. Microsoft, Amazon, or Google) and access Guacamole through your corporate proxy server. This can enable you to remotley access your Cloud hosted virtual machines without having to configure Firewall Rules or establish a Virtual Private Network.

## Preface

When the need for a "jump server" arose, I deployed the <a href="https://github.com/Azure/azure-quickstart-templates/tree/master/guacamole-rdp-vnc-gateway-existing-vnet">Apache Guacamole Azure Quick Start Template</a>. This template was a great introduction to Apache Guacamole. However, it leveraged multiple Docker images, and I wasn't certian what other software resided within these containers. The magic behind this template came from a base64 encoded custom data <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/linux/using-cloud-init">Cloud-Init</a> script, which didn't lend intself to my intention of sharing this template and allowing people to easily specify their desired database password and configuration. Since the skills required to develop ARM templates are required to obtain MCSE: Cloud Platform and Infrastructure certification, and that I needed to deploy Apache Guacamole, the challenge was on to develop an ARM template that could be reused and was configurable.

## Getting Started

These instructions will get you up and running with Apache Guacamole in no time at all.

### Prerequisites

TBD

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
**Tip**: Only a single Custom Script Extension can be assigned to an Azure virtual machine.
 * Option 1: Create a single script that executes all your desired commands or
 * Option 2: Create an entry point script (reference install.sh in this project) that executes your individual scripts.
```
References
* <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/windows/extensions-customscript">Custom Script Extension for Windows</a>
* <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/linux/extensions-customscript">Custom Script Extension for Linux</a>

## Acknowledgments

* <a href="https://github.com/Azure/azure-quickstart-templates/tree/master/guacamole-rdp-vnc-gateway-existing-vnet">Azure Quickstart Templates</a>
* <a href="https://github.com/MysticRyuujin/guac-install">Chase Wright</a>
