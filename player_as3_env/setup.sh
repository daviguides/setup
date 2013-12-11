#!/bin/bash
# Simple setup.sh for configuring AS3 player develop environment
#sudo apt-get install -y ant ant-contrib

export PROJECTS_DIR=$HOME/work
export BIN_DIR=${PROJECTS_DIR}/bin
export SOURCES_DIR=${PROJECTS_DIR}/sources
export LIBS_DIR=${SOURCES_DIR}/libs
export FLEX_DIR=${BIN_DIR}/apache-flex-sdk-4

echo "Simple setup.sh for configuring AS3 player develop environment"
cd $HOME
echo "creating folders structure"
mkdir -p work/{bin,sources/libs}
echo
cd $BIN_DIR
echo "downloading unpacking the opensource apache-flex-sdk"
echo
wget http://ftp.unicamp.br/pub/apache/flex/4.11.0/binaries/apache-flex-sdk-4.11.0-bin.tar.gz
tar -zxvf apache-flex-sdk-4.11.0-bin.tar.gz 
mv apache-flex-sdk-4.11.0-bin apache-flex-sdk-4

cd $FLEX_DIR/frameworks
#echo "use in $FLEX_DIR/frameworks:"
#echo "ant thirdparty-downloads"
#echo "to download thirdparty not necessary for as3 pure projetcs"

echo "downloading thirdparty playerglobal10_3.swc from adobe"
echo
mkdir -p libs/player/10.3/
cd libs/player/10.3/
wget http://fpdownload.macromedia.com/pub/flashplayer/updaters/10/playerglobal10_3.swc
mv playerglobal10_3.swc playerglobal.swc
echo "finished as3 dev env setup..."
echo
echo "cloning dependencies for the player from github"
echo
cd ~/work/sources/libs
git clone https://github.com/robertpenner/as3-signals.git
git clone https://github.com/daviguides/ktween.git 
git clone https://github.com/tschneidereit/SwiftSuspenders.git swift_suspenders
git clone https://github.com/daviguides/zoe.git 

echo "cloning playerlib to player from internal networking"
echo
git clone gitolite@git.devel.dsk:playerlib dsk_media
cd ~/work/sources/

echo "cloning player project from internal networking"
echo
git clone gitolite@git.devel.dsk:player
cd player/
echo "add home to local properties to build"
echo
echo "home.dir = $HOME" >> ant/home.properties
echo "doing your first building"
echo
ant
cd build/
ls -l *.swf
echo "their freshly baked cakes"
echo