sh /vagrant/scripts/prepare_disks.sh
dnf update -y
dnf install -y perl
dnf install -y net-tools
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd
sh /vagrant/scripts/adduser.sh
