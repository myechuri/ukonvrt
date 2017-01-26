## Nodejs application

### Step 1

Download ``hello.js`` to a host local directory.

### Step 2

Set ``UKONVRT_APP`` to fully qualified path of ``hello.js``.

```
# file /my-apps/hello.js
/my-apps/hello.js: ASCII text
```

### Step 3

Run ``ukonvrt`` to build unikernel image.

```
# export UKONVRT_OUT=/my-images

# UKONVRT_APP=/my-apps/hello.js ./ukonvrt
This tool depends on KVM and Docker.
Checking if app can be converted to OSv unikernel unmodified..
/my-apps/hello.js is of type: ASCII
APP_NAME=hello, APP_EXTENSION=js
/my-apps/hello.js can be converted to OSv unikernel unmodified.
Composing Capstanfile..
Building OSv image..
Building osv...
Uploading files...
1 / 1  100.00 % Application unikernel image size: 38M
#

# file $UKONVRT_OUT/osv/osv.qemu 
/my-images/osv/osv.qemu: QEMU QCOW Image (v2)
```
