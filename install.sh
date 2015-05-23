echo -e "\033[0;34mInstalling Zsh ...\033[0m"
sudo yum install zsh
sudo chsh -s /bin/zsh `whoami`

echo -e "\033[0;34mChecking for Git ...\033[0m"
hash git >/dev/null 2>&1 || {
  echo "git not installed"
  exit
}

echo -e "\033[0;34mCloning Dotfiles ...\033[0m"
env git clone --depth=1 git@github.com:midas/dotfiles.git .dotfiles

echo -e "\033[0;34mCloning Oh My Zsh...\033[0m"
env git clone --depth=1 git@github.com:midas/oh-my-zsh.git .oh-my-zsh
