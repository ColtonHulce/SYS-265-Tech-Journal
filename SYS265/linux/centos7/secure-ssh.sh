#secure-ssh.sh
#author ColtonHulce
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
USER="$1"
git pull
sudo useradd -m -d /home/$USER -s /bin/bash $USER
sudo usermod -aG wheel $USER
sudo mkdir /home/$USER/.ssh
sudo cp SYS-265-Tech-Journal/linux/public-keys/id_rsa.pub /home/$USER/.ssh/authorized_keys
sudo chmod 700 /home/$USER/.ssh
sudo chmod 600 /home/$USER/.ssh/authorized_keys
sudo chown -R $USER:$USER /home/$USER/.ssh
