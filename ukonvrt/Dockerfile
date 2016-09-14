FROM ubuntu:16.04

# Get OSv base ELF
RUN mkdir -p /osv-base
COPY ./loader.elf /osv-base/loader.elf

# Get binutils for access to readelf
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y vim && \
    apt-get install -y upx
RUN upx -d /osv-base/loader.elf

# Validate application for OSv
RUN mkdir -p /osv-checks
COPY ./check-app-osv-fit.sh /osv-checks/check-app-osv-fit.sh
RUN chmod +x /osv-checks/check-app-osv-fit.sh

# CMD /bin/bash
ENTRYPOINT ["/osv-checks/check-app-osv-fit.sh"]


