IMAGE_TAG ?= "local"
IMAGE_NAME=reviewer-reporter
DOCKER_COMPOSE = IMAGE_TAG=${IMAGE_TAG} docker-compose 

build:
	git submodule sync
	git submodule update --init --recursive
	${DOCKER_COMPOSE} build ${IMAGE_NAME}
