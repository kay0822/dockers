name=xxnet
image=xxnet

all:build

build:
	docker build -t $(name) $(name)

run:
	docker run -p 8085:8085 -p 8086:8086 -p 8087:8087 -v $(shell pwd)/mnt/data/launcher:/opt/xxnet/data/launcher -v $(shell pwd)/mnt/data/gae_proxy:/opt/xxnet/data/gae_proxy -d -it --name=$(name) $(image) #/bin/bash
	#docker run -p 8085:8085 -p 8086:8086 -p 8087:8087 -v $(shell pwd)/mnt/data:/opt/xxnet/data -d -it --name=$(name) $(image) #/bin/bash

start:
	docker start $(name)

stop:
	docker stop $(name) || :

rm: stop
	docker rm $(name) || :

rmi: rm
	docker rmi $(image)

console:
	docker exec -it $(name) /bin/bash
	
ps:
	docker ps -a

image:
	docker images

