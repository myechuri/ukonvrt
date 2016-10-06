## Java application

### Step 1

Download ``hello.jar`` to a host local directory.

### Step 2

Set ``UKONVRT_APP`` to fully qualified path for ``hello.jar`` on your host.

```
# file /my-apps/hello.jar
/my-apps/hello.jar: Java archive data (JAR)

# jar tvf /my-apps/hello.jar
     0 Wed Aug 19 16:51:40 PDT 2015 META-INF/
    90 Wed Aug 19 16:51:40 PDT 2015 META-INF/MANIFEST.MF
   417 Wed Aug 19 16:51:16 PDT 2015 Hello.class
# 
```

### Step 3

Run ``ukonvrt`` to build unikernel image.

```
# export UKONVRT_OUT=/my-images

# UKONVRT_APP=/my-apps/hello.jar UKONVRT_JAVA_MAIN=Hello ukonvrt
...

# file $UKONVRT_OUT/osv/osv.qemu 
/my-images/osv/osv.qemu: QEMU QCOW Image (v2), 10737418240 bytes
```
