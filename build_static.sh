#!/bin/sh

docker run -i -v `pwd`:/libvirt-exporter alpine:3.13 /bin/sh << 'EOF'
set -ex

# Install prerequisites for the build process.
apk update
apk add ca-certificates g++ git go libnl-dev linux-headers make perl pkgconf libtirpc-dev wget libxslt python3 python3-dev rpcgen py3-docutils glib glib-dev gnutls-dev ninja
update-ca-certificates

# Install libxml2. Alpine's version does not ship with a static library.
cd /tmp
wget ftp://xmlsoft.org/libxml2/libxml2-2.9.8.tar.gz
tar -xf libxml2-2.9.8.tar.gz
cd libxml2-2.9.8
./configure --disable-shared --enable-static
make -j$(nproc)
make install

#cd /tmp
#wget https://github.com/ninja-build/ninja/archive/refs/tags/v1.7.2.tar.gz
#tar -xf ./ninja-1.7.2.tar.gz

cd /tmp
wget https://github.com/mesonbuild/meson/releases/download/0.54.3/meson-0.54.3.tar.gz
tar -xf ./meson-0.54.3.tar.gz

# Install libvirt. Alpine's version does not ship with a static library.
cd /tmp
wget https://libvirt.org/sources/libvirt-7.1.0.tar.xz
tar -xf libvirt-7.1.0.tar.xz
cd libvirt-7.1.0
/tmp/meson-0.54.3/meson.py build
ninja -C build
ninja -C build install

#sed -i 's/^Libs:.*/& -lnl -ltirpc -lxml2/' /usr/local/lib/pkgconfig/libvirt.pc

# Build the libvirt-exporter.
cd /libvirt-exporter
export GOPATH=/gopath
mkdir -p /gopath/
ln -s /libvirt-exporter/vendor /gopath/src
mkdir -p /gopath/src/github.com/AlexZzz
ln -s /libvirt-exporter /gopath/src/github.com/AlexZzz/libvirt-exporter
go build --ldflags '-extldflags "-static"' -o libvirt-exporter
unlink /gopath/src/github.com/AlexZzz/libvirt-exporter
rmdir /gopath/src/github.com/AlexZzz
strip libvirt-exporter
EOF
