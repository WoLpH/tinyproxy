Docker containing the latest Tinyproxy build
---

Most of the docker images on dockerhub use pre-built tinyproxy builds which are horribly out of date. This is a very
simple image to get the latest binary to copy to your own docker images.

Usage:

    FROM wolph/tinyproxy as tinyproxy

    # Tinyproxy files
    COPY --from=builder /usr/local/bin/tinyproxy /usr/bin/tinyproxy
    COPY --from=builder /usr/local/etc/tinyproxy /usr/etc/tinyproxy
