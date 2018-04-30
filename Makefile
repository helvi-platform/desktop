.PHONY: build run

REPO  ?= helvi/desktop
TAG   ?= latest

build:
	docker build -t $(REPO):$(TAG) .

run:
	docker run --rm \
		-p 6081:443 \
		-v ${PWD}:/src:ro \
		-e USER=dev -e PASSWORD=mypassword \
		-e ALSADEV=hw:2,0 \
		-e SSL_PORT=443 \
		--device /dev/snd \
		--name desktop \
		$(REPO):$(TAG)

shell:
	docker exec -it desktop bash

gen-ssl:
	mkdir -p ssl
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout ssl/nginx.key -out ssl/nginx.crt
