#!/bin/bash

# Append OSv build manifest to boot into user-specified application.
echo "/tests/tst-hello.so: ${APP}" >> /root/osv/bootfs.manifest.skel

cd /root/osv
ARCH=aarch64 scripts/build

APP_NAME=$(basename "$APP")
OSV_IMAGE="/root/.capstan/repository/${APP_NAME}.img"
cp /root/osv/build/last/loader.img ${OSV_IMAGE}

OSV_IMAGE_SIZE=`ls -lah $OSV_IMAGE | awk -F " " {'print $5'}`
echo "Application unikernel image size: $OSV_IMAGE_SIZE"

exit 0
