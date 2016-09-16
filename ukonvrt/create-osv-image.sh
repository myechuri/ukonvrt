#!/bin/bash

set -ex

# Create Capstanfile
BASE=/osv
APP_NAME=${APP##*/}
cat > ${BASE}/Capstanfile << EOF
base: cloudius/osv-base

#
# The command line passed to OSv to start up the application.
#
cmdline: /tools/hello.so

#
# List of files that are included in the generated image.
#
files:
  /tools/$APP_NAME.so: $APP 
EOF

# run "capstan build" to generate OSv image
cd ${BASE}
/root/bin/capstan build
