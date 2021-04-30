# reviewer-reporter

Container for sending reports for libero reviewer

## Prerequisites

* You have a Linux or OSX machine. Windows should be supported via WSL 2 but has not been tested.
* You have installed a recent version of [Docker](https://www.docker.com/).
* You have credentials for sending email via STMP for the specified domain.

## Quick Start

Before you can start the app, two configuration files need to be created using the templates in the `config` directory.

First, the mailheader which is defines the header set for mail sent...

```
cp ./config/mailheader.template ./mailheader
```

Then, open the file in your prefered editor and at minimum set a valid value for `From`.


And second, the configuration for [mstmp](https://marlam.de/msmtp/) which is the utility used for sending email.

```
cp ./config/msmtprc.template ./msmtprc
```

Then, open the file in your prefered editor and at minimum set valid values for `host`, `from`, `user` and `password`.

You should then be able to launch the container using the below, setting a valid value for the `RECIPIENT` environment varible.

```
docker run -it --rm -e RECIPIENT='me@example.com' -v $PWD/mailheader:/mail-config/mailheader:ro -v $PWD/msmtprc:/etc/msmtprc:ro liberoadmin/reviewer-reporter
```

All being well, the target inbox should recieve an empty report.

To generate a full report, set the following environment variables inside the container to properly configure database access.

```
PGHOST
PGUSER
PGPASSWORD
PGDATABASE
PGPORT
```

## License

Licensed under [MIT](https://choosealicense.com/licenses/mit/).
