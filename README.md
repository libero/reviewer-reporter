# reviewer-reporter
Container for sending reports for libero reviewer

Used as part of the libero-reviewer [chart](https://github.com/libero/reviewer/tree/master/charts/libero-reviewer) to enable periodic email reports using k8s CronJobs.

## Configuration

Two configuration files need to be mounted into the container:

- /etc/msmtprc
- /mail-config/mailheader

Example `mailheader`:
```
From: no-reply@elifesciences.org
Subject: Status Report
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
```

Example `msmtprc`:
```
account default
host <MAILER_HOST>
port <MAILER_PORT>
from <FROM ADDRESS>
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
auth on
user <MAILER_AUTH_USER>
password <MAILER_AUTH_PASS>
logfile ~/.msmtp.log
```

Access to the database requires the following ENVVARS to be set:

```
PGHOST
PGUSER
PGPASSWORD
PGDATABASE
PGPORT
```

The recipient of the reports has to be set with: `RECIPIENT`