FROM node:8-alpine

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