SHELL:=/bin/bash

image=someimage
directory=$(image)
name=somename

all: 

build:
	docker build -t $(image) $(directory)

run:
	docker run -d -it --name=$(name) $(image)

run-console:
	docker run -d -it --name=$(name) $(image) env LANG=C.UTF-8 --entrypoint="" /bin/bash

console:
	docker exec -it $(name) /bin/bash

sleep:
	sleep 1

start:
	docker start $(name) || :

stop:
	docker stop $(name) || :

restart: stop start

rm: stop
	docker rm $(name) || :

rmi: rm
	docker rmi $(image) || :

ps:
	docker ps -a

image:
	docker images

log:
	docker logs $(name)
