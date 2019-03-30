FROM node:8-alpine
LABEL maintainer="fedor@borshev.com"

LABEL com.datadoghq.ad.logs='[{"source": "nuxt", "service": "nuxt"}]'

RUN apk update \
  && apk --no-cache add yarn

ADD healthcheck.js /

WORKDIR /srv
ONBUILD ADD package.json /srv
ONBUILD ADD yarn.lock /srv

ONBUILD RUN yarn

ENV HOST 0.0.0.0
ENV PORT 3000

CMD yarn start