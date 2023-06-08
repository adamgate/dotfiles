
# Get package managers
echo 'Installing package managers...'
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install curl  

sudo dnf install dnf-plugins-core -y
sudo dnf install -y fedora-workstation-repositories

# ensure package list is updated
sudo dnf update --refresh

# Install packages
echo 'Installing packages...'
sudo dnf install bismuth -y

# Languages & Frameworks
sudo dnf install neofetch -y
sudo dnf install python2 python3 -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh | bash
nvm install -lts
# sudo dnf install nodejs

 ## Docker Core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 ## Docker Desktop 
   #Download RPM Package
   #Install with command below
# sudo dnf install ./docker-desktop-<version>-<arch>.rpm

#Add dropbox with similar method to docker desktop

# Editors
sudo dnf install -y neovim python3-neovim
sudo dnf install code -y


# ClI Tools
sudo dnf copr enable keefle/cbonsai -y
sudo dnf copr enable atim/bottom -y
sudo dnf install cbonsai -y
sudo dnf install bottom -y

# Misc
sudo dnf install steam -y