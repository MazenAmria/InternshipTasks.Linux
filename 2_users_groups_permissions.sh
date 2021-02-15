useradd user1 --uid 601 --password redhat --shell /sbin/nologin

groupadd TrainingGroup
usermode user1 -aG TrainingGroup

useradd user2 --password redhat
useradd user3 --password redhat
groupadd admin
usermod user2 -aG admin
usermod user3 -aG admin,wheel
