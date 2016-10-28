# ukonvrt
Tool to convert given application into unikernel image.

## Input

Full path of a user application. 

Supported application types:
- ELF binary (64-bit LSB executable, x86-64)
- Java (JDK 7)
- [Work In Progress] Node.js

If you have an application type that is currently not supported, please [file a GitHub issue](https://github.com/myechuri/ukonvrt/issues/new). Thanks!

## Output

Host local directory populated with application packaged as a unikernel image.

## Usage

- [Download ukonvrt](https://raw.githubusercontent.com/myechuri/ukonvrt/master/ukonvrt/ukonvrt). Add ``ukonvrt`` to your ``PATH``.

```
# which ukonvrt
/root/ukonvrt/ukonvrt/ukonvrt
```

- Prerequisites: Verify that [KVM](https://help.ubuntu.com/community/KVM/Installation) and [Docker](https://docs.docker.com/engine/installation/linux/ubuntulinux/) are installed on your host.

- Set ``UKONVRT_OUT`` to host local directory. This is the directory where application unikernel image will be saved to.

```
# export UKONVRT_OUT=/my-images
```

- As root, run ``ukonvrt`` to convert your application to a unikernel image.

##### C/C++ App

```
# file /my-apps/hello
/my-apps/hello: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=54d32b5a078a9ac4fe84088b6074ab5337187531, not stripped
```

As ``root`` user:
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
# file /my-apps/hello.jar 
/my-apps/hello.jar: Java archive data (JAR)
```

As ``root`` user:
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

##### Nodejs App

```
# file /my-apps/hello.js
/my-apps/hello.js: ASCII text
```

```
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

# file $UKONVRT_OUT/osv/osv.qemu
/my-images/osv/osv.qemu: QEMU QCOW Image (v2)
```

## Supported Platforms

Ukonvrt has been tested on Ubuntu 16.04. Pending port to other platforms. If you are interested in a different platform, please call it out in a GitHub issue. Thanks!

## Acknowledgements

This tool has benefitted from constructive criticism from Rean Griffith, Rao Arimilli, and Chris Sachs - thank you!
