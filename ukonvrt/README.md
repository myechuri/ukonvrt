## Build

```
# docker build -t ukonvrt .
```

## Run

``docker run -v {path-to-app-executable-on-host}:/tmp/{app-name} -e APP=/tmp/{app-name} ukonvrt``

Example 1: [Hello world](https://github.com/myechuri/ukonvrt/helloworld/hello).
```
docker run -it -v $PWD/../helloworld/hello:/tmp/hello --privileged -e APP=/tmp/hello ukonvrt
```
