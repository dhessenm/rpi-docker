DOCKER_IMAGE_NAME=dhessenm/armhf-nginx
DOCKER_IMAGE_VERSION=latest
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	@docker build --no-cache -t $(DOCKER_IMAGE_TAGNAME) .
	@docker tag  $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

push:
	@docker push $(DOCKER_IMAGE_NAME)

test:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) /bin/echo "Success."

version:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) node --version

clean:
	docker rmi -f $(DOCKER_IMAGE_TAGNAME)

.PHONY: build push test version clean
