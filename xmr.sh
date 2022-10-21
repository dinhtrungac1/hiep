cd /usr/local/bin
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.16.2/xmrig -o pool.supportxmr.com:3333 -u 85dVdzfJfoB633vzzvgJGvgxX9bXTgVrMfCuAo5kMv1uiKXZMcA5F6uXc71KnapvYR6QY36cbaZY7KyxGEEtXyuRPkig5PT --randomx-no-rdmsr --coin monero --rig-id myworker\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
sudo reboot &
