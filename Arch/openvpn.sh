#!/bin/bash -v

if [$# -ne 2];
then
    echo "provide username(\$1) and password(\$2)";
    exit;
if

#sudo pacman -Sy networkmanager networkmanager-openvpn network-manager-applet openvpn
#sudo systemctl enable NetworkManager.service
#sudo systemctl start NetworkManager.service
#
#sudo mkdir -p /etc/sysctl.d
#sudo sh -c "echo 'net.ipv6.conf.all.disable_ipv6=1' > /etc/sysctl.d/40-ipv6.conf"
#sudo sh -c "echo 'net.ipv6.conf.default.disable_ipv6=1' >> /etc/sysctl.d/40-ipv6.conf"
#for netname in `ls /sys/class/net/`
#do
#sudo sh -c "echo 'net.ipv6.conf.$netname.disable_ipv6=1' >> /etc/sysctl.d/40-ipv6.conf"
#done
#sudo systemctl restart systemd-sysctl.service
#sudo systemctl restart NetworkManager.service
#
#
## sudo scp profile-56.ovpn huiseliming@192.168.0.104:~/client.ovpn
#sudo nmcli connection import type openvpn file ~/client.ovpn
#sudo sh -c "echo '' >> /etc/NetworkManager/system-connections/client.nmconnection"
#sudo sh -c "echo '[vpn]' >> /etc/NetworkManager/system-connections/client.nmconnection"
#sudo sh -c "echo 'connection-type=password' >> /etc/NetworkManager/system-connections/client.nmconnection"
#sudo sh -c "echo 'password-flags=0' >> /etc/NetworkManager/system-connections/client.nmconnection"
#sudo sh -c "echo 'username=$1' >> /etc/NetworkManager/system-connections/client.nmconnection"
#sudo sh -c "echo '' >> /etc/NetworkManager/system-connections/client.nmconnection"
#sudo sh -c "echo '[vpn-secrets]' >> /etc/NetworkManager/system-connections/client.nmconnection"
#sudo sh -c "echo 'password=$2' >> /etc/NetworkManager/system-connections/client.nmconnection"
#sudo sh -c "echo '' >> /etc/NetworkManager/system-connections/client.nmconnection"
# 
#sudo nmcli connection show
#
#sudo systemctl restart systemd-sysctl.service
#sudo systemctl restart NetworkManager.service
#
## sudo nmcli connection down "client"
#sudo nmcli connection up "client"
