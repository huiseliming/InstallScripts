sudo pacman -S openssh
sudo systemctl start sshd
sudo systemctl enable sshd
sudo pacman -S ufw
# sudo ufw allow 22/tcp
# ssh username@0.0.0.0
