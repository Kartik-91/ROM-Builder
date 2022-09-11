#!/bin/bash

# Manifest
export MANIFEST="https://github.com/crdroidandroid/android.git"
export MANIFEST_BRANCH="11.0"

# Device Info
export DEVICE="Pissarro" # Codename
export OEM="Xiaomi"
export PLATFORM="mt6877" # eg: sm6250, mt6765 etc.

# Trees
export DT_LINK="https://github.com/Kartik-91/device_xiaomi_pissarro"
export DCT_LINK="" # Device Common Tree, Leave Blank if None
export VT_LINK="https://github.com/Pranav-Talmale/vendor_xiaomi_pissarro"
export VCT_LINK="" # Vendor Common Tree, Leave Blank if None
export KT_LINK="" # Kernel Tree, Leave Blank if Prebuilt

# Trees Path
export DT_PATH="device/$OEM/$DEVICE"
export DCT_PATH="device/$OEM/${PLATFORM}-common"
export VT_PATH="vendor/$OEM/$DEVICE"
export VCT_PATH="vendor/$OEM/${PLATFORM}-common"
export KT_PATH="kernel/$OEM/$PLATFORM"

# Lunch Combos and Targets
export USE_BRUNCH_AS_TARGET=false # set it to "true" if you want to use brunch
export LUNCH_COMBO="lineage_pissarro-eng" # eg: "aosp_miatoll-userdebug", No need if USE_BRUNCH_AS_TARGET is set to true
export TARGET="bacon" # eg: "bacon", No need if USE_BRUNCH_AS_TARGET is set to true

# Output File (to upload)
export OUTPUT_FILE="" # eg: "PixelExperience*.zip"

# Extra Command
export EXTRA_CMD=""

# Not Recommended to Change
export SYNC_PATH=$HOME/work
export USE_CCACHE=1
export CCACHE_EXEC=$(which ccache)
export CCACHE_DIR="${SYNC_PATH}/.ccache"
export CCACHE_SIZE=30G
export J_VAL=16 # for -jx, eg: "16"
