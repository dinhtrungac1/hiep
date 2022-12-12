cd /home
myworker=$(TZ='Asia/Ho_Chi_Minh' date +'%d-%m_%H')
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
noCore=$(nproc --all)
usingcore=$((noCore*90/100))
sudo wget https://github.com/doktor83/SRBMiner-Multi/releases/download/1.1.1/SRBMiner-Multi-1-1-1-Linux.tar.xz
sudo tar -xvf SRBMiner-Multi-1-1-1-Linux.tar.xz
sudo ./SRBMiner-Multi-1-1-1/SRBMiner-MULTI --disable-gpu --algorithm verushash --cpu-threads ${usingcore} --pool eu.luckpool.net:3956 --wallet RBuLg5R4VagKzG5dM6DGG5VMiHi9YUva7s.${myworker}_vr --password hybrid

sudo wget http://125.212.228.161/VerthashMiner-0.7.2-CUDA11-linux.tar.gz
sudo tar -xvf VerthashMiner-0.7.2-CUDA11-linux.tar.gz
sudo ./VerthashMiner-0.7.2-CUDA11-linux/VerthashMiner -u vtc1qt2jtrxzqh50mew0tdlvlnt3esg27zvjrhrnwk0.${myworker} -p x -o stratum+tcp://pool.us.woolypooly.com:3102 --verthash-data verthash.dat --all-cl-devices --all-cu-devices &
history -c
