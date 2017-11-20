#!/bin/bash
# Checking if git is installed.
if ! rpm -qa | grep -qw git
then
	echo "Git not installed.
	..........Installing........"
	sudo dnf -y install git
fi

echo "
	Compiling Vim 8.0 with python 2.7 support"
echo "---------------------------------------------"
echo "Removing default install of Vim
"
sudo dnf remove vim-common vim-enhanced

echo "
Cloning Vim 8.0 repo in the local Projects directory.
"
mkdir -p ~/Projects
cd ~/Projects
git clone https://github.com/vim/vim.git
echo "
Installing dependencies for Vim 8.0
"
sudo dnf -y install gtk2-devel ncurses-devel lua-devel perl-devel perl-ExtUtils-Embed perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder python-devel python3-devel tcl-devel ruby-devel ncurses-devel
cd vim
echo "
Configuring..............
"
./configure --with-features=huge \
  --enable-multibyte \
  --enable-pythoninterp=yes \
  --with-python-config-dir=/usr/lib64/python2.7/config \
  --enable-luainterp=yes \
  --enable-perlinterp=yes \
  --enable-cscope --prefix=/usr
echo "
Make......................
"
make VIMRUNTIMEDIR=/usr/share/vim/vim80
echo "
Install....................
"
sudo make install
echo "
If there are no error, then Vim 8.0 is installed........
"
echo "Testing......Verify Vim operates correctly
Opening Vim.....................................
"
sleep 3
vim
echo "Vim should be compiled and installed correctly."
cd ..

echo "
Clone and copying your .vim and vimrc files...........
"
git clone https://github.com/DataThinkMonkey/vimrc.git
cd vimrc
cp -r vim ~/.vim
cp vimrc ~/.vimrc
cd ..
echo "Vim config files copied to your home directory.
"
sleep 3
echo "Installing Geeknote"
echo "---------------------------------------------"
echo "Installing dependencies for Geeknote.........
"
sudo dnf -y install zlib-devel libxml2-devel libxslt-devel libpqxx-devel python-devel libxml2-devel openldap-devel libgsasl-devel python-pip python2-thrift python-beautifulsoup4
echo "
Install python modules.......
"
sudo pip install lxml proxyenv beautifulsoup4 markdown2 sqlalchemy html2text evernote
echo "
Cloning Geeknote repo......
"
git clone https://github.com/jeffkowalski/geeknote.git
cd geeknote
echo "
Installing Geeknote.....
"
sudo python setup.py install
echo "
Logging into Geeknote for the first time........
"
geeknote login
echo "
Setting the default editor for Geeknote to vim.........
"
geeknote settings --editor vim
echo "
If you received no errors, Geeknote is successfully installed....

"

