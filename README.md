# .vim

## Setup
```sh
git clone git@github.com:connorjc/.vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
```

### Modifying Plugins

#### Add Plugins
Add a line in the `declare plugins` section in `.vimrc`.

Then restart vim or `:source ~/.vimrc` and do the following:

```
:PlugInstall
```

#### Remove Plugins
Comment/remove a line in the `declare plugins` section as well as any 
plugin configurations elsewhere in `.vimrc` labeled by a comment.

Then restart vim or `:source ~/.vimrc` and do the following:

```
:PlugClean
```

## If vim8 is not installed:
```sh
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
sudo rm /usr/bin/vim
sudo apt install python-dev python3-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev
```

## Optional: so vim can be uninstalled again via `dpkg -r vim`
```sh
sudo apt-get install checkinstall
```

## Required to install
```sh
sudo rm -rf /usr/local/share/vim 

cd /usr/local/src
sudo git clone https://github.com/vim/vim
cd vim
sudo git pull

cd src
sudo make distclean
cd ..

sudo ./configure \
--enable-multibyte \
--enable-pythoninterp \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp \
--with-python3-config-dir=/usr/local/lib/python3.7/config-3.7m-x86_64-linux-gnu \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
--with-x \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--with-compiledby="Connor Christian" \
--enable-fail-if-missing \
--with-vim-name=vim8

sudo make && sudo make install
```
