# ukonvrt
Tool to convert given application into unikernel image.

## Input

User Application. Supported application types:
- binary (ELF 64-bit LSB executable, x86-64)
- Java (.jar file)

## Output

Host local directory populated with QCOW2 image that boots into application.
