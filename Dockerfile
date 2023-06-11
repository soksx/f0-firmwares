FROM debian:bullseye-slim as firmware-base
# Set vars
ARG yq_version=v4.34.1
ARG yq_binary=yq_linux_amd64
# Install build dependences
RUN apt-get update; \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        ca-certificates; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Update certificates
RUN update-ca-certificates
# Download yq
ADD https://github.com/mikefarah/yq/releases/download/${yq_version}/${yq_binary} /usr/bin/yq
# Set permissions
RUN chmod +x /usr/bin/yq
# Defualt command
CMD ["/bin/bash"]

FROM firmware-base as final
ARG firmware_repo=https://github.com/flipperdevices/flipperzero-firmware
ARG firmware_version=0.84.2
# Clone firmware repository
RUN git clone --recurse-submodules --branch ${firmware_version} ${firmware_repo} /opt/firmware
WORKDIR /opt/firmware
# Compile firmware
RUN ./fbt
# Defualt command
CMD ["./fbt"]