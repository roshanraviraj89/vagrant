#!/bin/bash

#variables
username=ansibleadmin
password=Roshan1989

if [ $(id -u) -eq 0 ]; then
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo "User ${username} has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system."
	exit 2
fi

# add user to sudoers group

echo "${username}     ALL=(ALL)	  NOPASSWD: ALL" >> /etc/sudoers;

sudo_status=$?

if [ $sudo_status -eq 0 ]
then
  echo "$username has been granted sudo previllege"
else
  echo "Error in granting sudo privillege to ${username}"
fi

 
 
 