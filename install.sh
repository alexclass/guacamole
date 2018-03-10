#!/bin/bash

# This is an Entry Point Script that will execute nginx-install.sh and guac-install.sh

# Get the required script arguments for non-interactive mode
while [ "$1" != "" ]; do
    case $1 in
        -m | --mysqlpwd )       shift
                                argmysqlpwd="$1"
                                ;;
        -g | --guacpwd )        shift
                                argguacpwd="$1"
                                ;;
        -f | --fqdn )           shift
                                argfqdn="$1"
                                ;;
        -e | --email )          shift
                                argemail="$1"
    esac
    shift
done

# Get MySQL root password and Guacamole User password
if [ -n "$argmysqlpwd" ] && [ -n "$argguacpwd" ] && [ -n "$argfqdn" ] && [ -n "$argemail" ]; then
        mysqlrootpassword=$argmysqlpwd
        guacdbuserpassword=$argguacpwd
        certbotfqdn=$argfqdn
        certbotemail=$argemail
else
  echo "script arguments are required"
  exit 1
fi

./nginx-install.sh --fqdn $certbotfqdn --email $certbotemail
./guac-install.sh --mysqlpwd $mysqlrootpassword --guacpwd $guacdbuserpassword
