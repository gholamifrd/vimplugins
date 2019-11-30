# Installation
```
cd
git clone --recursive https://github.com/gholamifrd/vimplugins && cp -r vimplugins/.vim* ~/
```
if you want to use them as neovim plugins
```
mkdir ~/.config/nvim && cp vimplugins/init.vim ~/.config/nvim/init.vim
```
to use nvim with vim command put this into .bashrc file
```
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
```
