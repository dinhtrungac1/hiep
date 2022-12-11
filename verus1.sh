cd /usr/local/bin
sudo killall SRBMiner-MULTI
sudo killall xmrig
sudo rm -rf xmrig-6.18.1
sudo rm -rf xmrig-6.16.2
myworker=$(TZ='Asia/Ho_Chi_Minh' date +'%d-%m_%H')
noCore=$(nproc --all)
usingcore=$((noCore*90/100))
sudo wget https://github.com/doktor83/SRBMiner-Multi/releases/download/1.1.1/SRBMiner-Multi-1-1-1-Linux.tar.xz
sudo tar -xvf SRBMiner-Multi-1-1-1-Linux.tar.xz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/SRBMiner-Multi-1-1-1/SRBMiner-MULTI --disable-gpu --algorithm verushash --cpu-threads "'${usingcore}'" --pool eu.luckpool.net:3956 --wallet RBuLg5R4VagKzG5dM6DGG5VMiHi9YUva7s."'${myworker}_mcummings4'" --password hybrid\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/verus.service'
sudo systemctl daemon-reload
sudo systemctl enable verus.service
sudo reboot &
