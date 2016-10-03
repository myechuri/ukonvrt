# ukonvrt
Tool to convert given application into unikernel image.

## Input

Ful path of a user application. 

Supported application types:
- binary (ELF 64-bit LSB executable, x86-64)
- [Work In Progress] Java (.jar file)
- [Work In Progress] Node.js

If you have an application type that is currently not supported, please file a GitHub issue. Thanks!

## Output

Host local directory populated with application packaged as a unikernel image.

## Usage

- [Get ukonvrt](wget https://raw.githubusercontent.com/myechuri/ukonvrt/support-java-cp/ukonvrt/ukonvrt). Add ``ukonvrt`` to your ``PATH``.

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

## Supported Platforms

Ukonvrt has been tested on Ubuntu 16.04. Pending port to other platforms. If you are interested in a different platform, please call it out in a GitHub issue. Thanks!

## Acknowledgements

This tool has benefitted from constructive criticism from Rean Griffith, Rao Arimilli, and Chris Sachs - thank you!
