vgcreate -s 16M vgrp /dev/sdb1
lvcreate -l 50 vgrp -n lvol
mkfs.ext4 /dev/vgrp/lvol
mount /dev/vgrp/lvol /mnt/data
mkdir /mnt/data
mount /dev/vgrp/lvol /mnt/data
