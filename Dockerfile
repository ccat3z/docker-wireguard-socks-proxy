FROM alpine:3.15

ENV S6_OVERLAY_RELEASE=https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz
RUN wget "${S6_OVERLAY_RELEASE}" -O /tmp/s6overlay.tar.gz \
    && tar xzf /tmp/s6overlay.tar.gz -C / \
    && rm /tmp/s6overlay.tar.gz

RUN apk add --update --no-cache wireguard-tools dante-server

COPY /root/ /

ENTRYPOINT "/init"
