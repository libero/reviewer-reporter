# reviewer-reporter
Container for sending reports for libero reviewer

Used as part of the libero-reviewer [chart](https://github.com/libero/reviewer/tree/master/charts/libero-reviewer) to enable periodic email reports using k8s CronJobs.

## Configuration

Two configuration files need to be mounted into the container:

- /etc/ssmtp/ssmtp.conf
- /mail-config/mailheader

Example `mailheader`:
```
From: no-reply@elifesciences.org
Subject: Status Report
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
```

Example `ssmtp.conf`:
```
UseSTARTTLS=YES
FromLineOverride=YES
root=admin@example.com
mailhub=<MAILER_HOST>:<MAILER_PORT>
AuthUser=<MAILER_AUTH_USER>
AuthPass=<MAILER_AUTH_PASS>
```

Access to the database requires the following ENVVARS to be set:

```
PGHOST
PGUSER
PGPASSWORD
PGDATABASE
PGPORT
```
