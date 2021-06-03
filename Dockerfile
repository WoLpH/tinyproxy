###############################################################################
# Tinyproxy build and install
###############################################################################
FROM debian:buster as tinyproxy

# Install build environment for tinyproxy build
RUN apt-get update \
    && apt-get install -y automake gcc make xsltproc bash asciidoc valgrind git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN git clone https://github.com/tinyproxy/tinyproxy.git /build
RUN  ./autogen.sh \
  && ./configure \
  && make \
  && make install

###############################################################################

#FROM debian:buster as tinyproxy
#
## Tinyproxy files
#COPY --from=builder /usr/local/bin/tinyproxy /usr/bin/tinyproxy
#COPY --from=builder /usr/local/etc/tinyproxy /usr/etc/tinyproxy
