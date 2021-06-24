#!/bin/bash

apt-get -y install texlive-base texlive-lang-german apt-utils latexdraw \
            texlive-latex-extra latex-make latexdiff latexdraw wngerman \
            texlive-bibtex-extra nbibtex biber ingerman texlive-fonts-extra

wget http://launchpadlibrarian.net/166527105/texlive-latex-recommended_2013.20140215-1_all.deb
wget http://launchpadlibrarian.net/166527104/texlive-latex-base_2013.20140215-1_all.deb
sudo dpkg -i texlive-latex-base_2013.20140215-1_all.deb
sudo dpkg -i texlive-latex-recommended_2013.20140215-1_all.deb

cd /tmp && rm -rf libsynctex*
wget http://users.phys.psu.edu/%7Ecollins/software/latexmk-jcc/latexmk-445.zip

unzip latexmk*.zip
sudo cp latexmk/latexmk.pl /usr/local/bin
sudo mv /usr/local/bin/latexmk.pl /usr/local/bin/latexmk


if [ "$(uname -m)" == "x86_64" ]
then
  wget http://de.archive.ubuntu.com/ubuntu/pool/main/t/texlive-bin/libsynctex1_2015.20160222.37495-1_amd64.deb
  wget http://de.archive.ubuntu.com/ubuntu/pool/main/t/texlive-bin/libsynctex-dev_2015.20160222.37495-1_amd64.deb
else
  wget http://de.archive.ubuntu.com/ubuntu/pool/main/t/texlive-bin/libsynctex1_2015.20160222.37495-1_i386.deb
  wget http://de.archive.ubuntu.com/ubuntu/pool/main/t/texlive-bin/libsynctex-dev_2015.20160222.37495-1_i386.deb
fi

sudo dpkg -i libsynctex1* && sudo dpkg -i libsynctex-dev*

GIRARA_VERSION=0.2.6
ZATHURA_VERSION=0.3.6

# otherwise the own girara compilation will not work
sudo apt-get remove libgirara-dev

# need for zathura compilation
sudo apt-get install libmagic-dev

rm -rf /tmp/girara /tmp/zathura

git clone https://git.pwmt.org/pwmt/girara.git && cd girara && git checkout $GIRARA_VERSION && make && sudo make install
git clone https://git.pwmt.org/pwmt/zathura.git && cd zathura && git checkout $ZATHURA_VERSION && make WITH_SYNCTEX=1 && sudo make install

pip install -U blacktex
sudo apt-get install chktex lacheck rubber
