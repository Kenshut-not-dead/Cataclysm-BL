#!/bin/sh

if (pwd | grep "Cataclysm-BL/tools")
then
cd ..
else
if (ls Cataclysm-DDA)
then
echo "Cataclysm-BL already exists"
else
git clone https://github.com/Kenshut-not-dead/Cataclysm-BL
fi
cd Cataclysm-BL
fi

make

cd ..

if (ls dgamelaunch)
then
echo "dgamelaunch already exists"
else
git clone https://github.com/C0DEHERO/dgamelaunch
fi
cd dgamelaunch

./autogen.sh --enable-sqlite --enable-shmem --with-config-file=/opt/dgamelaunch/cbl/etc/dgamelaunch.conf
make
sudo ./dgl-create-chroot
