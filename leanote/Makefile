SHELL:=/bin/bash
image=leanote
name=leanote

all: build

tar:
	rm -rf leanote/data/leanote
	tar xvf leanote/packages/leanote-linux-amd64.bin.tar.gz -C leanote/data/

build: tar
	docker build -t $(image) $(image)

run:
	docker run -d -it -v $(shell pwd)/mnt/mongodb:/var/lib/mongodb -p 9000:9000 --name=$(name) $(image)

run-console:
	docker run -d -it -v $(shell pwd)/mnt/mongodb:/var/lib/mongodb -p 9000:9000 --name=$(name) $(image) /bin/bash

console:
	docker exec -it $(name) env LANG=C.UTF-8 /bin/bash

start:
	docker start $(name) || :

stop:
	docker stop $(name) || :

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

ubuntu-run:
	docker run -d -it -v $(shell pwd)/mnt/package:/package -p 9000:9000 --name=leanote-test ubuntu:16.04

ubuntu-stop:
	docker stop leanote-test

ubuntu-rm: ubuntu-stop
	docker rm -v  leanote-test

ubuntu-console:
	docker exec -it leanote-test bash

mongo-run:
	docker run -v $(shell pwd)/mnt/mongo:/data/db -d -it -e MONGODB_PASS="123123" --name=leanote-mongo tutum/mongodb

mongo-console:
	docker exec -it leanote-mongo bash

mongo-start:
	docker start leanote-mongo

mongo-stop:
	docker stop leanote-mongo || :

mongo-rm: mongo-stop
	docker rm leanote-mongo || :

mongo-restart: mongo-stop mongo-start

