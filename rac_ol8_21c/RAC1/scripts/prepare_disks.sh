function prepare_disk {
  MOUNT_POINT=$1
  DISK_DEVICE=$2

  echo "******************************************************************************"
  echo "Prepare ${MOUNT_POINT} disk." `date`
  echo "******************************************************************************"
  # New partition for the whole disk.
  echo -e "n\np\n1\n\n\nw" | fdisk ${DISK_DEVICE}

  # Add file system.
  mkfs.xfs -f ${DISK_DEVICE}1

  # Mount it.
  UUID=`blkid -o export ${DISK_DEVICE}1 | grep UUID | grep -v PARTUUID`
  mkdir ${MOUNT_POINT}
  echo "${UUID}  ${MOUNT_POINT}    xfs    defaults 1 2" >> /etc/fstab
  mount ${MOUNT_POINT}
}

prepare_disk /u01 /dev/sdb   #ORACLE_GRID_HOME
prepare_disk /u02 /dev/sdc   #oracle_software_dir
prepare_disk /u03 /dev/sdd   #grid_software_dir

#prepare_disk /u02 /dev/sdc
#prepare_disk /u03 /dev/sdd
