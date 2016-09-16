FROM ubuntu:16.04

# Get OSv base ELF
RUN mkdir -p /osv/osv-base
COPY ./loader.elf /osv/osv-base/loader.elf

# Get binutils for access to readelf
RUN apt-get update && \
    apt-get install -y build-essential vim upx curl qemu-utils qemu-kvm
RUN upx -d /osv/osv-base/loader.elf

# Install Capstan
RUN curl https://raw.githubusercontent.com/cloudius-systems/capstan/master/scripts/download | bash

# Validate application for OSv
COPY ./check-app-osv-fit.sh /osv/checks/check-app-osv-fit.sh
RUN chmod +x /osv/checks/check-app-osv-fit.sh
COPY ./create-osv-image.sh /osv/create-osv-image.sh
RUN chmod +x /osv/create-osv-image.sh

CMD /bin/bash
# ENTRYPOINT ["/osv-checks/check-app-osv-fit.sh"]


