sh /vagrant/scripts/prepare_disks.sh
dnf update -y
dnf install -y perl
dnf install -y net-tools
dnf install -y bind-utils
dnf install -y expect
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd
#sed -i '2inameserver 192.168.68.114' /etc/resolv.conf
echo -e 'DNS1=192.168.68.114\nDOMAIN=localdomain' >> /etc/sysconfig/network-scripts/ifcfg-eth1
echo -e 'DNS1=192.168.68.114\nDOMAIN=localdomain' >> /etc/sysconfig/network-scripts/ifcfg-eth2
echo -e 'DNS1=192.168.68.114\nDOMAIN=localdomain' >> /etc/sysconfig/network-scripts/ifcfg-eth3
sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
systemctl restart NetworkManager.service
sh /vagrant/scripts/adduser.sh



