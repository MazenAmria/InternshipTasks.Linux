#!/bin/bash

# create a volume group with extent size 16M
vgcreate -s 16M vgrp /dev/sdb1

# create logical volume with 50 extents
lvcreate -l 50 vgrp -n lvol

# create ext4 filesystem with the logical volume
mkfs.ext4 /dev/vgrp/lvol

# mount destination
mnt_dest="/mnt/data"

# create the destination (and its parents) if not exist
mkdir -p $(mnt_dest)

# extract the uuid of the logical volume
uuid=$(blkid | grep lvol | cut -d" " -f2)

# write it to /etc/fstab
# <file system>	<mount point>	<type>	<options>	<dump>	<pass>
# $uuid			$mnt_dest		ext4	defaults	0		2
printf '%s\t%s\text4\tdefaults\t0\t2\n' $uuid $mnt_dest >> /etc/fstab
