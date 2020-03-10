IMAGE_NAME=libero/reviewer-reporter
IMAGE_TAG ?= "local"

build:
	git submodule sync
	git submodule update --init --recursive
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
