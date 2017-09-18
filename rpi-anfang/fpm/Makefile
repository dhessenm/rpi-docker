DOCKER_IMAGE_NAME=dhessenm/rpi-anfang-fpm
DOCKER_IMAGE_VERSION=latest
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	@docker build -t $(DOCKER_IMAGE_TAGNAME) .
	@docker tag  $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

build-nc:
	@docker build --no-cache -t $(DOCKER_IMAGE_TAGNAME) .
	@docker tag  $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

test:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) /bin/echo "Success."

version:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) apache2 --version

push:
	docker push $(DOCKER_IMAGE_NAME)

clean:
	docker rmi -f $(DOCKER_IMAGE_TAGNAME)

.PHONY: build test version push clean
