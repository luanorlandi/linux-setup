#!bin/bash

# Update apt
echo "Updating apt" &&
apt update > /dev/null

# Install GET if not installed already
command -v GET > /dev/null || (
    echo "Installing GET" &&
    apt install libwww-perl > /dev/null
)

# Google Chrome
echo 'Installing Google Chrome' &&
GET https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > google.deb &&
(dpkg -i google.deb > /dev/null || apt install -fy > /dev/null) &&
google-chrome --version &&
rm google.deb

# Change Favorite apps
command -v dconf > /dev/null &&
echo 'Changing Favorite apps' &&
dconf && dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop']"

# Remote server
echo 'Installing openssh-server' &&
apt install openssh-server -y > /dev/null &&
ps ax | grep sshd

# Visual Studio Code
echo 'Installing Visual Studio Code' &&
GET https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable > code.deb &&
(dpkg -i code.deb > /dev/null || apt install -fy > /dev/null) &&
code -v &&
rm code.deb

# Git
echo 'Installing Git' &&
(apt install git -y > /dev/null || apt install -fy > /dev/null) &&
git --version

# Node
echo 'Installing Node' &&
bash <(GET https://raw.githubusercontent.com/creationix/nvm/master/install.sh) &&
export NVM_DIR="$HOME/.nvm" &&
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" &&  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" &&  # This loads nvm bash_completion
nvm install node --lts --latest-npm &&
node -v &&
nvm -v &&

# Hyper
echo 'Installing Hyper' &&
GET https://releases.hyper.is/download/deb > hyper.deb &&
(dpkg -i hyper.deb > /dev/null || apt install -fy > /dev/null) &&
rm hyper.deb &&
echo "Hyper installed"

# Zsh
echo 'Installing Zsh' &&
apt install zsh -y > /dev/null &&
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" > /dev/null &&
chsh -s /bin/bash &&
zsh --version

# Docker
echo "Installing Docker"
sh -c "$(wget https://get.docker.com/ -O -)" > /dev/null
docker -v