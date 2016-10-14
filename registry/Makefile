SHELL:=/bin/bash
image=registry
name=registry


run:
	docker run -d -p 5000:5000 --restart=always 			\
		-v $(shell pwd)/mnt/auth:/auth						\
		-v $(shell pwd)/mnt/certs:/certs					\
		-v $(shell pwd)/mnt/registry:/var/lib/registry		\
		-e "REGISTRY_AUTH=htpasswd" 						\
		-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" 	\
		-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd		\
		-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt 	\
		-e REGISTRY_HTTP_TLS_KEY=/certs/domain.key 		\
		--name=$(name) registry:2


console:
	docker exec -it $(name) /bin/bash

start:
	docker start $(name) | :

stop:
	docker stop $(name) | :

rm: stop
	docker rm $(name) | :

ps:
	docker ps -a

image:
	docker images

log:
	docker logs $(name)
