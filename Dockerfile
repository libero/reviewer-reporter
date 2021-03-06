FROM alpine:3@sha256:a15790640a6690aa1730c38cf0a440e2aa44aaca9b0e8931a9f2b0d7cc90fd65

RUN  apk add --no-cache msmtp gettext libintl postgresql-client\
  && mkdir /mail-config \
  && mkdir /scripts

ADD scripts /scripts/

CMD "/scripts/report-generator.sh"
