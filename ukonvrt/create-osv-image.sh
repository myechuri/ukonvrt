#!/bin/bash

set -ex

# Create Capstanfile
BASE=/osv
mv $APP $APP.so
cat > ${BASE}/Capstanfile << EOF
base: cloudius/osv-base

#
# The command line passed to OSv to start up the application.
#
cmdline: /tools/hello.so

#
# The command to use to build the application.  In this example, we just use
# make.
#
build: make

#
# List of files that are included in the generated image.
#
files:
  /tools/$APP.so: $APP.so
EOF
