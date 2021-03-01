#!/bin/bash

#ccache
sudo apt install -y ccache &

#repo
sudo curl https://storage.googleapis.com/git-repo-downloads/repo -o /bin/repo
sudo chmod a+rx /bin/repo
git config --global color.ui true
git config --global user.name ci
git config --global user.email ci@ci.ci
mkdir ~/rom
cd ~/rom
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/Apon77Lab/android_.repo_local_manifests.git --depth=1 -b aex .repo/local_manifests 
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 30 -q

. build/envsetup.sh
lunch aosp_mido-user
