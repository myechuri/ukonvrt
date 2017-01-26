# ukonvrt
Tool to convert given application into unikernel image.

## Input

Full path of a user application. 

Supported application types:

X86-64:
- ELF binary (64-bit LSB executable)
- Java (JDK 7)
- Node.js

Aarch64:
- ELF binary

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

### X86-64 Applications

##### Example 1: C/C++ App

As ``root`` user:
```
# # Set UKONVRT_ROOT to top-level of ukonvrt repo.
# export UKONVRT_ROOT=/root/ukonvrt

# # Application example 1: hello world C ELF built for x86-64
# file $UKONVRT_ROOT/sample-apps/x86-64/c/helloworld/hello 
/root/ukonvrt/sample-apps/x86-64/c/helloworld/hello: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=54d32b5a078a9ac4fe84088b6074ab5337187531, not stripped

# UKONVRT_APP=$UKONVRT_ROOT/sample-apps/x86-64/c/helloworld/hello UKONVRT_OUT=/my-images $UKONVRT_ROOT/ukonvrt/ukonvrtThis tool depends on KVM and Docker.
Checking if app can be converted to OSv unikernel unmodified..
/root/ukonvrt/sample-apps/x86-64/c/helloworld/hello is of type: ELF, link type:  dynamically linked
Checking if application GLIBC symbols are available from OSv..
/root/ukonvrt/sample-apps/x86-64/c/helloworld/hello can be converted to OSv unikernel unmodified.
Composing Capstanfile..
Building OSv image..
Building osv...
Downloading cloudius/osv-base/index.yaml...
154 B / 154 B  100.00 % 
Downloading cloudius/osv-base/osv-base.qemu.gz...
20.02 MB / 20.02 MB  100.00 % sss
Uploading files...
1 / 1  100.00 % Application unikernel image size: 28M

# file /my-images/cloudius/osv-base/osv-base.qemu 
/my-images/cloudius/osv-base/osv-base.qemu: QEMU QCOW Image (v2), 10737418240 bytes
```

##### Example 2: Java App

As ``root`` user:
```
# # Set UKONVRT_ROOT to top-level of ukonvrt repo.
# export UKONVRT_ROOT=/root/ukonvrt

# # Application example 2: hello world JAR
# file $UKONVRT_ROOT/sample-apps/x86-64/java/hello.jar 
/root/ukonvrt/sample-apps/x86-64/java/hello.jar: Java archive data (JAR)

# UKONVRT_APP=$UKONVRT_ROOT/sample-apps/x86-64/java/hello.jar UKONVRT_JAVA_MAIN=Hello UKONVRT_OUT=/my-images $UKONVRT_ROOT/ukonvrt/ukonvrt
This tool depends on KVM and Docker.
Checking if app can be converted to OSv unikernel unmodified..
/root/ukonvrt/sample-apps/x86-64/java/hello.jar is of type: Java, link type: 
/root/ukonvrt/sample-apps/x86-64/java/hello.jar can be converted to OSv unikernel unmodified.
Composing Capstanfile..
Building OSv image..
Building osv...
Downloading cloudius/osv-openjdk/index.yaml...
169 B / 169 B  100.00 % 
Downloading cloudius/osv-openjdk/osv-openjdk.qemu.gz...
74.10 MB / 74.10 MB  100.00 % ss5s
Uploading files...
1 / 1  100.00 % Application unikernel image size: 95M

# file /my-images/osv/osv.qemu 
/my-images/osv/osv.qemu: QEMU QCOW Image (v2), 10737418240 bytes
```

##### Example 3: Nodejs App

As ``root`` user:
```
# # Set UKONVRT_ROOT to top-level of ukonvrt repo.
# export UKONVRT_ROOT=/root/ukonvrt

# # Application example 3: hello world Node.js
# file $UKONVRT_ROOT/sample-apps/x86-64/nodejs/hello.js 
/root/ukonvrt/sample-apps/x86-64/nodejs/hello.js: ASCII text

# UKONVRT_APP=$UKONVRT_ROOT/sample-apps/x86-64/nodejs/hello.js UKONVRT_OUT=/my-images $UKONVRT_ROOT/ukonvrt/ukonvrt
This tool depends on KVM and Docker.
Checking if app can be converted to OSv unikernel unmodified..
/root/ukonvrt/sample-apps/x86-64/nodejs/hello.js is of type: ASCII
APP_NAME=hello, APP_EXTENSION=js
/root/ukonvrt/sample-apps/x86-64/nodejs/hello.js can be converted to OSv unikernel unmodified.
Composing Capstanfile..
Building OSv image..
Building osv...
Uploading files...
1 / 1  100.00 % Application unikernel image size: 38M

# file /my-images/osv/osv.qemu 
/my-images/osv/osv.qemu: QEMU QCOW Image (v2), 10737418240 bytes
```
### Aarch64 Applications

##### Example 4: C/C++ App

As ``root`` user:
```
# # Set UKONVRT_ROOT to top-level of ukonvrt repo.
# export UKONVRT_ROOT=/root/ukonvrt

# # Application example 4: hello world C/C++ Aarch64
# file $UKONVRT_ROOT/sample-apps/aarch64/hello
/root/ukonvrt/sample-apps/aarch64/hello: ELF 64-bit LSB shared object, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=76f5d9d76f867ad61dbc92577173c406067ae6f7, not stripped

# UKONVRT_APP=$UKONVRT_ROOT/sample-apps/aarch64/hello UKONVRT_OUT=/my-images $UKONVRT_ROOT/ukonvrt/ukonvrt
This tool depends on KVM and Docker.
Checking if app can be converted to OSv unikernel unmodified..
/root/ukonvrt/sample-apps/aarch64/hello is of type: ELF, link type:  dynamically linked, target arch:  ARM aarch64
Checking if application GLIBC symbols are available from OSv..
/root/ukonvrt/sample-apps/aarch64/hello can be converted to OSv unikernel unmodified.
Building into build/release.aarch64
  GEN gen/include/osv/version.h
scripts/osv-version.sh: 4: scripts/osv-version.sh: git: not found
  GEN build/release.aarch64/gen/include/bits/alltypes.h
  AS arch/aarch64/boot.s
  CXX loader.cc
  ...
  ...
  IMGEDIT build/release.aarch64/loader.img
WARNING: Image format was not specified for 'build/release.aarch64/loader.img' and probing guessed raw.
         Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions.
loader_size=10250704 zfs_start=10485760 zfs_size=10726932480 fs_size=10737418240
Application unikernel image size: 9.8M

# file /my-images/hello.img 
/my-images/hello.img: data
```
## Supported Platforms

Ukonvrt has been tested on Ubuntu 16.04. Pending port to other platforms. If you are interested in a different platform, please call it out in a GitHub issue. Thanks!

## Acknowledgements

This tool has benefitted from constructive criticism from Rean Griffith, Rao Arimilli, and Chris Sachs - thank you!
