# reviewer-reporter
Docker image for sending daily reports via email

## Purpose

This is intended to be used by xPub (https://github.com/elifesciences/elife-xpub) and by Libero Reviewer for generating database reports on a (bi-)daily basis.

## Examples

`make build` - This will build the docker container packaging the scripts that are run can be found in `cron_tasks_folder`.

`docker-compose up` - The `docker-compose.yaml` file serves as an example on how this should be used. The actual `docker-compose.yaml` file for deployment can be found here: https://github.com/elifesciences/elife-xpub-deployment/blob/2cda7d3218f8d00876b2d04c4f1942370148ca3a/docker-compose.yml#L4
