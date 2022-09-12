#!/bin/bash

id -u circleci &>/dev/null || sudo adduser --disabled-password --gecos GECOS circleci

sudo mkdir -p /var/opt/circleci
sudo chmod 0750 /var/opt/circleci
sudo chown -R circleci /var/opt/circleci /opt/circleci/circleci-launch-agent
echo "circleci ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

source vars.sh

# Make the Directory if it doesn't exist
mkdir -p $SYNC_PATH

# Change to the Source Directory
cd $SYNC_PATH

# Init Repo
repo init --depth=1 -u $MANIFEST -b $MANIFEST_BRANCH

# Sync the Sources
repo sync -j$(nproc --all) --force-sync --no-tags --no-clone-bundle

# Clone Trees
git clone --single-branch --depth=1 $DT_LINK $DT_PATH || { echo "ERROR: Failed to Clone the Device Trees!" && exit 1; }
cd device/xiaomi/pissarro/prebuilts/
pwd
wget https://siddrive.ga/0:/vendor.img
cd $SYNC_PATH
pwd
git clone --single-branch --depth=1 $DCT_LINK $DCT_PATH
git clone --single-branch --depth=1 $VT_LINK $VT_PATH
git clone --single-branch --depth=1 $VCT_LINK $VCT_PATH
git clone --single-branch --depth=1 $KT_LINK $KT_PATH

# Exit
exit 0
