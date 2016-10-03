## Convert your app to unikernel image

#### Prerequisites

``ukonvrt`` requires the following packages on your host:
- docker
- kvm

#### Convert App to image

- Check that ``ukonvrt`` is in your ``PATH``.

```
# which ukonvrt
/root/ukonvrt/ukonvrt/ukonvrt
```

- Set ``UKONVRT_OUT`` to host local directory. This is the directory where application unikernel image will be saved to.

```
# export UKONVRT_OUT=/my-images
```

- As root, run ``ukonvrt`` to convert your application to a unikernel image.

##### C/C++ App

```
# UKONVRT_APP=/my-apps/hello ukonvrt

This tool depends on KVM and Docker.
Checking if app can be converted to OSv unikernel unmodified..
/my-apps/hello is of type: ELF, link type:  dynamically linked
Checking if application GLIBC symbols are available from OSv..
/my-apps/hello can be converted to OSv unikernel unmodified.
Composing Capstanfile..
Building OSv image..
Building osv...
Downloading cloudius/osv-base/index.yaml...
154 B / 154 B  100.00 % 
Downloading cloudius/osv-base/osv-base.qemu.gz...
20.02 MB / 20.02 MB  100.00 % sss
Uploading files...
1 / 1  100.00 % Application unikernel image size: 28M

```

##### Java App

```
# UKONVRT_APP=/my-apps/hello.jar UKONVRT_JAVA_MAIN=Hello ukonvrt
This tool depends on KVM and Docker.
Checking if app can be converted to OSv unikernel unmodified..
/my-apps/hello.jar is of type: Java, link type: 
/my-apps/hello.jar can be converted to OSv unikernel unmodified.
Composing Capstanfile..
Building OSv image..
Building osv...
Downloading cloudius/osv-openjdk/index.yaml...
169 B / 169 B  100.00 % 
Downloading cloudius/osv-openjdk/osv-openjdk.qemu.gz...
74.10 MB / 74.10 MB  100.00 % ss8s
Uploading files...
1 / 1  100.00 % Application unikernel image size: 95M

# file $UKONVRT_OUT/osv/osv.qemu
/my-images/osv/osv.qemu: QEMU QCOW Image (v2)
```

#### Disclaimer

Tested on Ubuntu 16.04. Needs to be ported to other platforms.
