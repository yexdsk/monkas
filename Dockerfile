FROM alpine:edge

ARG AUUID="346a4b6d-03d2-4f5b-84a9-fe483f8391c6"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page222/penyler.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
