FROM golang:1.17.3-alpine3.14

ENV LIBVIRT_EXPORTER_PATH=/libvirt-exporter
ENV LIBXML2_VER=2.9.8

RUN apk add ca-certificates g++ git libnl-dev linux-headers make libvirt-dev libvirt && \
    wget ftp://xmlsoft.org/libxml2/libxml2-${LIBXML2_VER}.tar.gz -P /tmp && \
    tar -xf /tmp/libxml2-${LIBXML2_VER}.tar.gz -C /tmp/ && \
    cd /tmp/libxml2-${LIBXML2_VER} && \
    ./configure && \
    make -j$(nproc) && \
    make install && \
    mkdir -p $LIBVIRT_EXPORTER_PATH
WORKDIR $LIBVIRT_EXPORTER_PATH
COPY . .

RUN go build -mod vendor

ENTRYPOINT [ "./libvirt-exporter" ]
