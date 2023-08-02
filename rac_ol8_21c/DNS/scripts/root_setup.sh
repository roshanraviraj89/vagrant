dnf update -y
dnf install -y perl
dnf install -y net-tools
dnf install -y bind-utils
dnf install -y bind
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd
#sed -i '2inameserver 192.168.68.114' /etc/resolv.conf
echo -e 'nameserver 192.168.68.114\n search localdomain' > /etc/resolv.conf      ## dns server ip
echo -e  'nameserver 8.8.8.8'  >> /etc/resolv.conf                               ##add google dns entry
#echo -e 'nameserver 10.0.2.3\n search localdomain' >> /etc/resolv.conf
systemctl restart named
echo -e 'DNS1=192.168.68.114\nDOMAIN=localdomain' >> /etc/sysconfig/network-scripts/ifcfg-eth1
sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
systemctl restart NetworkManager.service
sh /vagrant/scripts/adduser.sh



