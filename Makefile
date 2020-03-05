IMAGE_NAME=reviewer-reporter

build:
	docker build -t ${IMAGE_NAME} .

shell:
	docker run -it --env-file=.env ${IMAGE_NAME} /bin/sh
