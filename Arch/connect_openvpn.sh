sudo pacman -Sy networkmanager networkmanager-openvpn network-manager-applet openvpn
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

sudo mkdir -p /etc/sysctl.d
sudo vim /etc/sysctl.d/40-ipv6.conf
# >> net.ipv6.conf.all.disable_ipv6=1
# >> net.ipv6.conf.default.disable_ipv6=1
# >> net.ipv6.conf.lo.disable_ipv6=1
# >> net.ipv6.conf.eth0.disable_ipv6=1

sudo systemctl restart systemd-sysctl.service
sudo systemctl restart NetworkManager.service

# nmcli connection import type openvpn file profile-56.ovpn
nmcli connection import type openvpn file ?.ovpn

sudo systemctl restart systemd-sysctl.service
sudo systemctl restart NetworkManager.service

