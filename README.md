# Apache Guacamole

Apache Guacamole is a clientless remote desktop gateway. It supports standard protocols like SSC, Telnet, VNC, and RDP. It is open source and requires no plugins or client software installed. Thanks to HTML5, once Guacamole is installed on a server, all you need to access your remote desktops and servers is a web browser.

Since Guacamole is accessed via your web browser, you can install Guacamole on a Cloud Service Provider (e.g. Microsoft, Amazon, or Google) and access Guacamole through your corporate proxy server. This can enable you to remotley access your Cloud hosted virtual machines without having to configure Firewall Rules (cumbersome) or establish a Virtual Private Network.

## Getting Started

This project provides the following components to get you up and running with Apache Guacamole as quickly as possible.

```
Azure Resource Manager (ARM) template that:
* Creates a Ubuntu 16.04 virtual machine with a public ip address
* Creates a Network Security Group to allow ports 22,80,443 
```

## Deploy to Azure



<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbigredthelogger%2Fguacamole%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fbigredthelogger%2Fguacamole%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Acknowledgments

* <a href="https://github.com/Azure/azure-quickstart-templates/tree/master/guacamole-rdp-vnc-gateway-existing-vnet">Azure Quickstart Templates</a>
* <a href="https://github.com/MysticRyuujin/guac-install">Chase Wright</a>
