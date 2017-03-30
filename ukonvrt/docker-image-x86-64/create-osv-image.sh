#!/bin/bash

# Create Capstanfile
BASE=/osv
APP_NAME=$(basename "$APP")
APP_EXTENSION="${APP_NAME##*.}"
APP_NAME="${APP_NAME%.*}"

if [ $APP_EXTENSION == $APP_NAME ]; then
    BASE_IMG=osv-base
    CMDLINE=$APP
elif [ $APP_EXTENSION == 'jar' ]; then
    BASE_IMG=osv-openjdk
    CMDLINE="/java.so -cp $APP $UKONVRT_JAVA_MAIN"
elif [ $APP_EXTENSION == 'js' ]; then
    BASE_IMG=osv-node
    CMDLINE="/libnode.so --max-old-space-size=1000 --max-semi-space-size=512 --noconcurrent_sweeping $APP"
else
    echo "Unsupported Application format $APP_EXTENSION"
    exit 1
fi

echo "Composing Capstanfile.."
cat > ${BASE}/Capstanfile << EOF
# OSv base image.
base: cloudius/$BASE_IMG

# The command line passed to OSv to start up the application.
cmdline: $CMDLINE

# List of files that are included in the generated image.
files:
  $APP: $APP 
EOF

# run "capstan build" to generate OSv image
cd ${BASE}
echo "Building OSv image.."
/root/bin/capstan build

# verify that osv.img exists
OSV_IMAGE=/root/.capstan/repository/osv/osv.qemu
if [ ! -f $OSV_IMAGE ]; then
    echo "Build failed to generate $OSV_IMAGE"
    exit 1
fi
OSV_IMAGE_SIZE=`ls -lah $OSV_IMAGE | awk -F " " {'print $5'}`
echo "Application unikernel image size: $OSV_IMAGE_SIZE"
