SHELL:=/bin/bash
image=someimage
name=somename

all: build

build:
	docker build -t $(image) $(image)

run:
	docker run -d -it --name=$(name) $(image)

run-console:
	docker run -d -it --name=$(name) $(image) --entrypoint="" /bin/bash

console:
	docker exec -it $(name) /bin/bash

restart: stop start

start:
	docker start $(name) | :

stop:
	docker stop $(name) | :

rm: stop
	docker rm $(name) | :

rmi: rm
	docker rmi $(image) | :

ps:
	docker ps -a

image:
	docker images

log:
	docker logs $(name)
