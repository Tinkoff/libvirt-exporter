FROM golang:alpine

ENV LIBVIRT_EXPORTER_PATH=/libvirt-exporter

RUN apk add ca-certificates g++ git go libnl-dev linux-headers make libvirt-dev libvirt && \
    wget ftp://xmlsoft.org/libxml2/libxml2-2.9.8.tar.gz -P /tmp && \
    tar -xf /tmp/libxml2-2.9.8.tar.gz -C /tmp/ && \
    cd /tmp/libxml2-2.9.8 && \
    ./configure && \
    make -j$(nproc) && \
    make install && \
    mkdir -p $LIBVIRT_EXPORTER_PATH
WORKDIR $LIBVIRT_EXPORTER_PATH
COPY . .

RUN go build -mod vendor

ENTRYPOINT [ "./libvirt-exporter" ]
