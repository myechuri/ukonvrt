## Build

```
# docker build -t myk .
```

## Run

``docker run -v {path-to-app-executable-on-host}:/tmp/{app-name} -e APP=/tmp/{app-name} myk``

Example:
```
# docker run -it -v /tmp/nginx:/tmp/nginx -e APP=/tmp/nginx myk
```
