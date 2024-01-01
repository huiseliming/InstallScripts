#+++++++++++++++++++++++++++++++++++++++++++++++
#Access Server 2.13.0 has been successfully installed in /usr/local/openvpn_as
#Configuration log file has been written to /usr/local/openvpn_as/init.log
#
#
#Access Server Web UIs are available here:
#Admin  UI: https://199.115.228.166:943/admin
#Client UI: https://199.115.228.166:943/
#To login please use the "openvpn" account with "ESIjF6jpA1Ns" password.
#(password can be changed on Admin UI)
#+++++++++++++++++++++++++++++++++++++++++++++++


apt update&& apt -y install ca-certificates wget net-tools gnupg
wget -q -O https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list
apt update&& apt -y install openvpn-as

cp /usr/local/openvpn_as/lib/python/pyovpn-2.0-py3.8.egg{,.bak}
mkdir ~/openvpnas
cd ~/openvpnas
cp /usr/local/openvpn_as/lib/python/pyovpn-2.0-py3.8.egg .
sudo apt install unzip
unzip -q pyovpn-2.0-py3.8.egg
cd pyovpn/lic/
mv uprop.pyc uprop2.pyc
echo "from pyovpn.lic import uprop2" >> uprop.py
echo "old_figure = None" >> uprop.py
echo "def new_figure(self, licdict):" >> uprop.py
echo "      ret = old_figure(self, licdict)" >> uprop.py
echo "      ret['concurrent_connections'] = 6666" >> uprop.py
echo "      return ret" >> uprop.py
echo "" >> uprop.py
echo "for x in dir(uprop2):" >> uprop.py
echo "      if x[:2] == '__':" >> uprop.py
echo "         continue" >> uprop.py
echo "      if x == 'UsageProperties':" >> uprop.py
echo "         exec('old_figure = uprop2.UsageProperties.figure')" >> uprop.py
echo "         exec('uprop2.UsageProperties.figure = new_figure')" >> uprop.py
echo "      exec('%s = uprop2.%s' % (x, x))" >> uprop.py
python3 -O -m compileall uprop.py && mv __pycache__/uprop.*.pyc uprop.pyc
sudo apt install zip
zip -rq pyovpn-2.0-py3.8.egg ./pyovpn ./EGG-INFO ./common
cp ./pyovpn-2.0-py3.8.egg /usr/local/openvpn_as/lib/python/
systemctl restart openvpnas.service
systemctl status openvpnas.service
