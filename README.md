# vimrc
Configuration for neovim

## Install

### python
Looks for python3 in path

```
sudo apt install python3-pip
pip3 install --user --upgrade pynvim autopep8 pylint yapf jedi isort
```

### golang

```
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
```

### ctags - for tagbar

OS-X
```
brew install universal-ctags  # installs exuberant ctags
```

Linux
```
sudo apt-get install autoconf
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure
make
sudo make install
```

### Configure Neovim

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/.cache/dein
cd ~/.config
git clone git@github.com:plockc/nvim.git
nvim  # it will auto-install plugins
```

### Update Plugins

Inside of nvim, to update neovim plugins
```
:UpdateRemotePlugins
```

And for dein managed plugins:
```
call dein#update()
```


For golang
```
:GoBinaryInstall
```
