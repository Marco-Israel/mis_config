
#!/bin/bash
# instGlobal.sh

GVERSION="6.6.4"
echo "instGlobal.sh ...."

echo "install package for GNU global..."
sudo apt-get update
sudo apt-get -y install curl
sudo apt-get -y install wget
sudo apt-get -y install ncurses-dev
sudo apt-get -y install exuberant-ctags

sudo apt-get -y install python

CUR=`pwd`
echo "install GNU global..."
wget http://tamacom.com/global/global-$GVERSION.tar.gz
tar zxvf global-$GVERSION.tar.gz
cd global-$GVERSION
./configure
make
sudo make install
cd $CUR

echo "install pip..."
curl -kL https://bootstrap.pypa.io/get-pip.py | sudo python


echo "install pygments..."
sudo pip install pygments

echo "$0 done."
exit 0
