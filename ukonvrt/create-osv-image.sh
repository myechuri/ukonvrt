#!/bin/bash

set -ex

# Create Capstanfile
BASE=/osv
# APP_NAME=${APP##*/}

APP_NAME=$(basename "$APP")
APP_EXTENSION="${APP_NAME##*.}"
APP_NAME="${APP_NAME%.*}"

if [ $APP_EXTENSION == $APP_NAME ]; then
    BASE_IMG=osv-base
    CMDLINE=$APP
elif [ $APP_EXTENSION == 'jar' ]; then
    BASE_IMG=osv-openjdk
    CMDLINE="/java.so -cp $APP $JAVA_CMD"
else
    echo "Unsupported Application format $APP_EXTENSION"
    exit 1
fi

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
/root/bin/capstan build
