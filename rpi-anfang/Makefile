DOCKER_IMAGE_NAME=dhessenm/armhf-apache2
DOCKER_IMAGE_VERSION=latest
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

WP_VERSION=4.8.1
DOMAIN=anfang.hopto.org

default: setup

setup:
	@if [ ! -f wordpress.tar.gz ]; then curl -o wordpress.tar.gz -fSL https://wordpress.org/wordpress-${WP_VERSION}.tar.gz;fi
	mkdir -p ./www/anfang.hopto.org
	tar -xzf wordpress.tar.gz -C ./www/${DOMAIN}
	mv ./www/${DOMAIN}/wordpress ./www/${DOMAIN}/blog
        sudo chown www-data:www-data ./www/${DOMAIN}

build:
	@docker build -t $(DOCKER_IMAGE_TAGNAME) .
	@docker tag  $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

test:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) /bin/echo "Success."

version:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) apache2 --version

push:
	docker push $(DOCKER_IMAGE_NAME)

deploy:
	@docker stack deploy --compose-file anfang.yml --resolve-image never anfang

add-label:
	@docker node update --label-add htype=backend raspi5
	@docker node update --label-add htype=backend raspi6

del-label:
	@docker node update --label-rm htype=backend raspi5
	@docker node update --label-rm htype=backend raspi6

clean:
	rm -rf ./www/${DOMAIN}/

.PHONY: build test version push clean
