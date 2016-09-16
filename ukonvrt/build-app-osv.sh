#!/bin/bash

set -ex

echo "Checking if app can be converted to OSv unikernel unmodified"
/osv/checks/check-app-osv-fit.sh
if [ $? -eq 1 ]; then
    echo "Aborting"
    exit 1
fi

echo "Building application OSv"
/osv/create-osv-image.sh
