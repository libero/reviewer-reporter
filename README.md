# reviewer-reporter
Docker image for sending daily reports via email

## Purpose

This is intended to be used by xPub (https://github.com/elifesciences/elife-xpub) and by Libero Reviewer for generating database reports on a (bi-)daily basis.

## Examples

`make build` - This will build the docker container packaging the scripts that are run can be found in `cron_tasks_folder`.

`make shell` - This will run the container locally for testing. Please use a `.env` file to store the secrets

`docker-compose up` - The `docker-compose.yaml` file serves as an example on how this should be used.

