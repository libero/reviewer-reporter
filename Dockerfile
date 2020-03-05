FROM alpine:3.11

RUN apk update \
  && apk add --no-cache ssmtp gettext libintl \
  && mkdir /mail-config \
  && mkdir /scripts

ADD mail-config /mail-config/
ADD scripts /scripts/

CMD [ "/bin/sh", "/scripts/startup.sh" ]