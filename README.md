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

```
root@ubuntu:~# export UKONVRT_OUT=/my-images/

root@ubuntu:~# file /my-apps/hello
/my-apps/hello: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=54d32b5a078a9ac4fe84088b6074ab5337187531, not stripped

root@ubuntu:~# UKONVRT_APP=/my-apps/hello ukonvrt
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
20.02 MB / 20.02 MB  100.00 % ss2s
Uploading files...
1 / 1  100.00 % Application unikernel image size: 28M

root@ubuntu:~# ls $UKONVRT_OUT
cloudius  osv
root@ubuntu:~# file $UKONVRT_OUT/osv/osv.qemu 
/my-images//osv/osv.qemu: QEMU QCOW Image (v2), 10737418240 bytes
```
## Supported Platforms

Ukonvrt has been tested on Ubuntu 16.04. Pending port to other platforms. If you are interested in a different platform, please call it out in a GitHub issue. Thanks!

## Acknowledgements

This tool has benefitted from constructive criticism from Rean Griffith, Rao Arimilli, and Chris Sachs - thank you!
