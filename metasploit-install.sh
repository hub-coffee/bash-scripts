#!/bin/bash

#Metasploit Framework - Debian Server Installation v10;

sudo apt update
sudo apt-get install -y ruby-dev libpq-dev libpcap-dev libsqlite3-dev postgresql git ruby-bundler build-essential patch ruby-dev zlib1g-dev liblzma-dev libgmp-dev
sudo mkdir /opt/metasploit
sudo chown root:root -R /opt/metasploit
sudo chmod 770 -R /opt/metasploit
git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit
sudo chmod +x /opt/metasploit/
cd /opt/metasploit
gem install bundler -v'~>1.16'
bundle install
git config --global user.name "root"
git config --global user.email "root@test.com"
sudo /opt/metasploit/msfupdate
/opt/metasploit/msfconsole

######## END Metasploit Installation ######


####### OPENVPN INSTALLATION ##########

# use su command to set up superuser
apt-get update && apt-get upgrade && apt-get install curl openvpn unzip
cd /tmp && wget https://files.ovpn.com/ubuntu_cli/ovpn-us-atlanta-tcp.zip && unzip ovpn-us-atlanta-tcp.zip && mkdir -p /etc/openvpn && mv config/* /etc/openvpn && chmod +x /etc/openvpn/update-resolv-conf && rm -rf config && rm -f ovpn-us-atlanta-tcp.zip
echo "root" >> /etc/openvpn/credentials
echo "VXOFIcchfddl;;;;" >> /etc/openvpn/credentials
openvpn --config /etc/openvpn/ovpn.conf --daemon
curl https://www.ovpn.com/v2/api/client/ptr
systemctl start openvpn

# STATE CHECK COMMAND
#systemctl start openvpn    # Starts OpenVPN and connects to OVPN
#systemctl stop openvpn     # Stops OpenVPN
#systemctl restart openvpn  # Restarts OpenVPN
#systemctl status openvpn   # Shows status for OpenVPN

####### END OF OPENVPN INSTALLATION ##########