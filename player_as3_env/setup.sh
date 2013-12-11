#!/bin/bash
# Simple setup.sh for configuring AS3 player develop environment
#sudo apt-get install -y ant ant-contrib

export PROJECTS_DIR=$HOME/work
export BIN_DIR=${PROJECTS_DIR}/bin
export SOURCES_DIR=${PROJECTS_DIR}/sources
export LIBS_DIR=${SOURCES_DIR}/libs
export FLEX_DIR=${BIN_DIR}/apache-flex-sdk-4

echo "Simple setup.sh for configuring AS3 player develop environment \n"
cd $HOME
echo "creating folders structure \n"
mkdir -p work/{bin,sources/libs}

cd $BIN_DIR
echo "downloading unpacking the opensource apache-flex-sdk \n"
wget http://ftp.unicamp.br/pub/apache/flex/4.11.0/binaries/apache-flex-sdk-4.11.0-bin.tar.gz
tar -zxvf apache-flex-sdk-4.11.0-bin.tar.gz 
mv apache-flex-sdk-4.11.0-bin apache-flex-sdk-4

cd $FLEX_DIR/frameworks
#echo "use in $FLEX_DIR/frameworks:"
#echo "ant thirdparty-downloads"
#echo "to download thirdparty not necessary for as3 pure projetcs"

echo "\ndownloading thirdparty playerglobal10_3.swc from adobe \n"

mkdir -p libs/player/10.3/
cd libs/player/10.3/
wget http://fpdownload.macromedia.com/pub/flashplayer/updaters/10/playerglobal10_3.swc
mv playerglobal10_3.swc playerglobal.swc
echo "\nfinished as3 dev env setup... \n"
echo "\ncloning dependencies for the player  from gith \n"
echo
cd ~/work/sources/libs
git clone https://github.com/robertpenner/as3-signals.git
git clone https://github.com/daviguides/ktween.git 
git clone https://github.com/tschneidereit/SwiftSuspenders.git swift_suspenders
git clone https://github.com/daviguides/zoe.git 

echo "cloning playerlib to player from internal networking\n"
echo
git clone gitolite@git.devel.dsk:playerlib dsk_media
cd ~/work/sources/

echo "cloning player project from internal networking \n"
echo
git clone gitolite@git.devel.dsk:player
cd player/
echo "add home to local properties to build \n"
echo
echo "home.dir = $HOME" >> ant/home.properties
echo " \n \ndoing your first building \n"
echo
ant
cd build/
echo " \n \ntheir freshly baked cakes \n"
ls -l *.swf
echo