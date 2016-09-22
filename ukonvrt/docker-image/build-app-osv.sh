#!/bin/bash

echo "Checking if app can be converted to OSv unikernel unmodified.."
/osv/checks/check-app-osv-fit.sh
if [ $? -eq 1 ]; then
    echo "Aborting"
    exit 1
fi

/osv/create-osv-image.sh
if [ $? -eq 1 ]; then
    echo "Failed to build OSv image"
    exit 1
fi
