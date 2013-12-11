#!/bin/bash
# Simple setup.sh for configuring AS3 player develop environment
sudo apt-get install -y ant ant-contrib

#create structure
cd ~/
mkdir -p work/{bin,sources/libs}
cd ~/work/bin
# download apache-flex-sdk
wget http://ftp.unicamp.br/pub/apache/flex/4.11.0/binaries/apache-flex-sdk-4.11.0-bin.tar.gz
tar -zxvf apache-flex-sdk-4.11.0-bin.tar.gz 
mv apache-flex-sdk-4.11.0-bin apache-flex-sdk-4
cd apache-flex-sdk-4/frameworks
# ant thirdparty-downloads
mkdir -p libs/player/10.3/
cd libs/player/10.3/
wget http://fpdownload.macromedia.com/pub/flashplayer/updaters/10/playerglobal10_3.swc
mv playerglobal10_3.swc playerglobal.swc
echo "finished"
cd ~/work/sources/libs
git clone https://github.com/robertpenner/as3-signals.git
git clone https://github.com/daviguides/ktween.git 
git clone https://github.com/tschneidereit/SwiftSuspenders.git swift_suspenders
git clone https://github.com/daviguides/zoe.git 
git clone gitolite@git.devel.dsk:playerlib dsk_media
cd ~/work/sources/
git clone gitolite@git.devel.dsk:player
cd player/
echo "home.dir = $HOME" >> ant/home.properties
ant
cd player/