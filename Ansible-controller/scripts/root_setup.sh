sh /vagrant/scripts/prepare_disks.sh
dnf update -y
dnf install -y python3
dnf install -y oracle-epel-release-el8
dnf install -y ansible
dnf install -y perl
dnf install -y net-tools
sh /vagrant/scripts/adduser.sh
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl reload sshd


