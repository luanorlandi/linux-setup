# Update apt
sudo apt update

# Google Chrome
GET https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > google.deb
sudo dpkg -i google.deb
sudo apt-get -f install -y
rm google.deb

# Change Favorite apps
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop']"

# Remote server
sudo apt-get install openssh-server -y

# Visual Studio Code
GET https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable > code.deb
sudo dpkg -i code.deb
rm code.deb

# Git
sudo apt install git -y

# Node
GET https://raw.githubusercontent.com/creationix/nvm/master/install.sh > nvm.sh &&
chmod 777 nvm.sh &&
./nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node --lts --latest-npm

# Hyper
GET https://releases.hyper.is/download/deb > hyper.deb
sudo dpkg -i hyper.deb
rm hyper.deb

# Zsh
sudo apt install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "bash -c zsh" >> ~/.bash_profile