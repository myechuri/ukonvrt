#!/bin/bash

# Check if input binary can be converted to an OSv qcow2 image.

OSV_BASE=/osv/base/loader.elf

FILE_TYPE=`file $APP | awk '{print $2}'`
LINK_TYPE=`file $APP | awk -F[:,] '{print $5}'`
echo "$APP is of type: $FILE_TYPE, link type: $LINK_TYPE"

if [ "$FILE_TYPE" == "ELF" ]; then
    # 64-bit System V ELF payload

    OSV_SUPPORT=1
    if [ "$LINK_TYPE" == " dynamically linked" ]; then
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
                OSV_SUPPORT=0
                echo "$i not found"
            fi
        done
    fi
    if [ $OSV_SUPPORT == 1 ]; then
        echo "$APP can be converted to OSv unikernel unmodified."
        exit 0
    else
        echo "$APP cannot be converted to OSv unikernel because of missing support for symbols listed above."
        exit 1
    fi
    rm $DUMPFILE

else
    echo "$FILE_TYPE is currently unsupported"
    exit 1
fi

