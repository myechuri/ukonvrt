#!/bin/bash

# Check if input binary can be converted to an OSv qcow2 image.

OSV_BASE=/osv-base/loader.elf

# Adapted from
# https://github.com/cloudius-systems/osv/blob/master/scripts/check-libcfunc-avail.sh
echo "Checking if application GLIBC symbols are available from OSv.."
DUMPFILE=`mktemp`
objdump -t $OSV_BASE > $DUMPFILE
FUNCS=`objdump -T $APP | grep GLIBC|sed -e "s/.*GLIBC\(XX\)\?_[0-9.]* //"`

for i in $FUNCS; do
    grep -q " $i$" $DUMPFILE
    FOUND=$?
    if [ $FOUND != 0 ]; then
        echo "$i not found"
    fi
done
rm $DUMPFILE
