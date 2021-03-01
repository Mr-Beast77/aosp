#!/bin/bash

#repo
sudo curl https://storage.googleapis.com/git-repo-downloads/repo -o /bin/repo
sudo chmod a+rx /bin/repo
git config --global color.ui true
git config --global user.name ci
git config --global user.email ci@ci.ci
mkdir ~/aosp
cd ~/aosp
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/Apon77/ppui -b aex device/xiaomi/mido --depth=1
git clone https://github.com/Apon77/vendor -b aex vendor/xiaomi --depth=1
git clone https://github.com/zeelog/android_kernel_xiaomi_mido kernel/xiaomi/mido --depth=1

cd ~/aosp
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 30 -q
alias gcl='git clone'
cd hardware/qcom-caf/msm8996/ && rm -rf audio media display && gcl https://github.com/android-eleven/hardware_qcom_media -b caf-msm8996-r media && gcl https://github.com/android-eleven/hardware_qcom_display -b caf-msm8996-r display && gcl https://github.com/android-eleven/hardware_qcom_audio -b caf-msm8996-r audio && cd -

. build/envsetup.sh
lunch aosp_mido-user
