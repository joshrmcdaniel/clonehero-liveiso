#!/bin/sh -e
[ $(id -u) -ne 0 ] && { echo "Please run this script as root." ; exit 1 ; }
[ ! $(command -v lb) ] &&  { echo "Please install live-boot to run this script." ; exit 1 ; }
START_DIR="$PWD"
CH_DIR="$PWD/ch-live"
mkdir -p $CH_DIR || true
cd $CH_DIR
lb config --architecture amd64 --distribution bookworm \
    --binary-images iso-hybrid --bootappend-live "boot=live components hostname=clonehero username=game" \
    --archive-areas "main contrib non-free non-free-firmware" 
cd "$START_DIR"
cp -r hooks/normal/* "$CH_DIR/config/hooks/normal/."
cp -r hooks/live/* "$CH_DIR/config/hooks/live/."
cp -r package-lists/* "$CH_DIR/config/package-lists/."
cd $CH_DIR
lb build