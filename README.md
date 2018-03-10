# Apache Guacamole ARM Template

Apache Guacamole is a clientless remote desktop gateway. It supports standard protocols like SSC, Telnet, VNC, and RDP. It is completely free and open source software and requires no plugins or client software installed. Thanks to HTML5, once Guacamole is installed on a server, all you need to access your desktops is a web browser. This project provides the Azure Resource Manager template to deploy a Ubuntu 16.04 virtual machine, and scripts to install Nginx, Tomcat, MySQL, Apache Guacamole, and even a free Let's Encrypt SSL certificate.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbigredthelogger%2Fguacamole%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fbigredthelogger%2Fguacamole%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Acknowledgments

* <a href="https://github.com/Azure/azure-quickstart-templates/tree/master/guacamole-rdp-vnc-gateway-existing-vnet">Azure Quickstart Templates</a>
* <a href="https://github.com/MysticRyuujin/guac-install">Chase Wright</a>
