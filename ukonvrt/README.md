## Convert your app to unikernel image

#### Prerequisites

``ukonvrt`` requires the following packages on your host:
- docker
- kvm

#### Convert

- Set ``UKONVRT_OUT`` to host local directory.

```
# export UKONVRT_OUT=/my-images
```

- As root, run ``ukonvrt`` to convert your application to a unikernel image.

```
# UKONVRT_APP=/my-apps/hello ukonvrt
```

#### Disclaimer

Tested on Ubuntu 16.04. Needs to be ported to other platforms.
