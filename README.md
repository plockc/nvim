# vimrc
Configuration for neovim

## Install

### python
Looks for python3 in path

```
sudo apt install python3-pip
pip3 install --user --upgrade pynvim autopep8 pylint yapf
```

### Configure Neovim

````
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/.cache/dein
cd ~/.config
git clone git@github.com:plockc/nvim.git
nvim  # it will auto-install plugins
```
