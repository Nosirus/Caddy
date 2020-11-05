FROM golang:buster AS builder
ENV VERSION_CADDY=2.1.1 \
    VERSION_XCADDY=0.1.4
RUN curl \
        --fail \
        --location \
        --show-error \
        https://github.com/caddyserver/xcaddy/releases/download/v${VERSION_XCADDY}/xcaddy_v${VERSION_XCADDY}_linux_amd64 \
        --output xcaddy \
 && chmod +x xcaddy
RUN ./xcaddy build v${VERSION_CADDY} \
        --output /usr/bin/caddy \
        --with github.com/sjtug/caddy2-filter \

FROM caddy:2.1.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
