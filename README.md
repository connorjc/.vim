# .vim

## Copy over .vimrc
```sh
ln -s ~/.vim/.vimrc ~/.vimrc
```

## If vim8 is not installed:
```sh
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
sudo rm /usr/bin/vim
sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev sudo apt install python3-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev
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
sudo git pull && sudo git fetch

cd src
sudo make distclean
cd ..

sudo ./configure \
--enable-multibyte \
--enable-perlinterp=dynamic \
--enable-rubyinterp=dynamic \
--with-ruby-command=/usr/bin/ruby \
--enable-pythoninterp=dynamic \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--enable-luainterp \
--with-luajit \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
--with-x \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--with-compiledby="Connor Christian" \
--enable-fail-if-missing

sudo make && sudo make install
```
