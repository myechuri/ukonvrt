## Build

```
# docker build -t ukonvrt .
```

## Run

``docker run -v {path-to-app-executable-on-host}:/tmp/{app-name} -v {host-path-to-output-image-dir}:/root/.capstan/repository -e APP=/tmp/{app-name} ukonvrt``

Example 1: [Hello world](https://github.com/myechuri/ukonvrt/helloworld/hello).
```
docker run -it -v $PWD/../helloworld/hello:/tmp/hello -v /tmp/my-images:/root/.capstan/repository --privileged -e APP=/tmp/hello ukonvrt
```

Output:
```
# ls -lha /tmp/my-images/cloudius/osv-base/
total 28M
drwxr-xr-x 2 root root 4.0K Sep 19 19:54 .
drwxr-xr-x 3 root root 4.0K Sep 19 19:54 ..
-rw-r--r-- 1 root root  154 Sep 19 19:54 index.yaml
-rw-r--r-- 1 root root  28M Sep 19 19:54 osv-base.qemu
# ls -lha /tmp/my-images/osv/
total 28M
drwxr-xr-x 2 root root 4.0K Sep 19 19:54 .
drwxr-xr-x 4 root root 4.0K Sep 19 19:54 ..
-rw-r--r-- 1 root root  28M Sep 19 19:54 osv.qemu
```

Example 2: Java app
```
docker run -it -v /tmp/my-test.jar:/my-test.jar -v /tmp/my-images:/root/.capstan/repository --privileged -e APP=/my-test.jar -e JAVA_CMD=test.my.example.TestService ukonvrt
```
