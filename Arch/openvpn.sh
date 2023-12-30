sudo pacman -Sy networkmanager networkmanager-openvpn network-manager-applet openvpn
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

sudo mkdir -p /etc/sysctl.d
sudo sh -c "echo 'net.ipv6.conf.all.disable_ipv6=1' > /etc/sysctl.d/40-ipv6.conf"
sudo sh -c "echo 'net.ipv6.conf.default.disable_ipv6=1' >> /etc/sysctl.d/40-ipv6.conf"
for netname in `ls /sys/class/net/`
do
sudo sh -c "echo 'net.ipv6.conf.$netname.disable_ipv6=1' >> /etc/sysctl.d/40-ipv6.conf"
done
sudo systemctl restart systemd-sysctl.service
sudo systemctl restart NetworkManager.service

nmcli connection import type openvpn file ~/client.ovpn

sudo systemctl restart systemd-sysctl.service
sudo systemctl restart NetworkManager.service

