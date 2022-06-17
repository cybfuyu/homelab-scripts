#!/bin/bash
if [ "$EUID" -ne 0 ]
    then echo "Script must be run as root."
    exit
fi

apt-get update
apt-get install curl

curl https://downloads.linux.hpe.com/SDR/hpPublicKey2048.pub | apt-key add -
curl https://downloads.linux.hpe.com/SDR/hpPublicKey2048_key1.pub | apt-key add -
curl https://downloads.linux.hpe.com/SDR/hpePublicKey2048_key1.pub | apt-key add -

add-apt-repository 'deb [arch=amd64,i386] http://downloads.linux.hpe.com/SDR/repo/mcp bionic/current non-free'
add-apt-repository 'deb [arch=amd64,i386] http://downloads.linux.hpe.com/SDR/repo/mcp bionic/10.80 non-free'
apt-get update

read -p "Adding libjson-c3 from Ubuntu Bionic repos. This may cause system breakage. Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
wget http://security.ubuntu.com/ubuntu/pool/main/j/json-c/libjson-c3_0.12.1-1.3ubuntu0.3_amd64.deb
dpkg -i libjson-c3_0.12.1-1.3ubuntu0.3_amd64.deb

apt-get install amsd hponcfg lm-sensors
echo "Done."
