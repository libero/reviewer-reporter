FROM alpine:3.11

RUN apk update \
  && apk add --no-cache ssmtp gettext libintl \
  && mkdir /mail-config \
  && mkdir /scripts \
  && mkdir /etc/periodic/daily8am \
  && mkdir /etc/periodic/daily1pm

ADD mail-config /mail-config/
ADD scripts /scripts/
ADD cron_tasks_folder/daily8am/send-mail /etc/periodic/daily8am
ADD cron_tasks_folder/daily1pm/send-mail /etc/periodic/daily1pm

CMD [ "/bin/sh", "/scripts/startup.sh" ]