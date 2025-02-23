#!/bin/bash

source $CONFIG

# Change user
su - ubuntu

# Make the Directory if it doesn't exist
mkdir -p $SYNC_PATH

# Change to the Source Directory
cd $SYNC_PATH

# Init Repo
git config --global color.ui false
repo init --depth=1 -u $MANIFEST -b $MANIFEST_BRANCH
free -h

# Sync the Sources
repo sync -j$(nproc --all) --force-sync --no-tags --no-clone-bundle

# Clone Trees
git clone --single-branch --depth=1 $DT_LINK $DT_PATH || { echo "ERROR: Failed to Clone the Device Trees!" && exit 1; }
cd device/xiaomi/pissarro/prebuilts/
wget https://siddrive.ga/0:/vendor.img
wget https://siddrive.ga/0:/odm.img
cd $SYNC_PATH
git clone --single-branch --depth=1 $DCT_LINK $DCT_PATH
git clone --single-branch --depth=1 $VT_LINK $VT_PATH
git clone --single-branch --depth=1 $VCT_LINK $VCT_PATH
git clone --single-branch --depth=1 $KT_LINK $KT_PATH
free -h
# Exit
exit 0
