cd /usr/local/bin
sudo killall SRBMiner-MULTI
sudo rm -rf  SRBMiner-Multi-1-1-1
sudo killall xmrig
sudo rm -rf xmrig-6.18.1
sudo rm -rf xmrig-6.16.2
mwker=$(TZ='Asia/Ho_Chi_Minh' date +'%d-%m_%H:%M')
noCore=$(nproc --all)
usingcore=$((noCore*92/100))
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.18.1/xmrig-6.18.1-bionic-x64.tar.gz
sudo tar xvzf xmrig-6.18.1-bionic-x64.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.18.1/xmrig -o xmr-asia1.nanopool.org:14444 -u 85dVdzfJfoB633vzzvgJGvgxX9bXTgVrMfCuAo5kMv1uiKXZMcA5F6uXc71KnapvYR6QY36cbaZY7KyxGEEtXyuRPkig5PT."'${mwker}_C_${noCore}'" --randomx-no-rdmsr --threads="'${usingcore}'" --cpu-max-threads-hint=95 --coin monero --rig-id myworker\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
sudo reboot &
