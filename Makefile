IMAGE_NAME=reviewer-reporter

build:
	git submodule sync
	git submodule update --init --recursive
	docker build -t ${IMAGE_NAME} .

shell:
	docker run -it --env-file=.env ${IMAGE_NAME} /bin/sh
