FROM node:14.16.0-alpine3.13
LABEL maintainer="fedor@borshev.com"

LABEL com.datadoghq.ad.logs='[{"source": "nuxt", "service": "nuxt"}]'

RUN apk update \
  && apk --no-cache add yarn dumb-init

ADD healthcheck.js /

WORKDIR /srv

ENV HOST 0.0.0.0
ENV PORT 3000

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD yarn start
