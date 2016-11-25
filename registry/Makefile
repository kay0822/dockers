SHELL:=/bin/bash
image=registry
name=registry


run:
	docker run -d -p 5001:5000 --restart=always 			\
		-v $(shell pwd)/mnt/auth:/auth:ro					\
		-v $(shell pwd)/mnt/certs:/certs:ro					\
		-v $(shell pwd)/mnt/registry:/var/lib/registry		\
		-e "REGISTRY_AUTH=htpasswd" 						\
		-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" 	\
		-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd		\
		-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/ca.crt 		\
		-e REGISTRY_HTTP_TLS_KEY=/certs/ca.key 				\
		--name=$(name) registry:2

console:
	docker exec -it $(name) /bin/sh

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

gc:
	docker exec $(name) registry garbage-collect /etc/docker/registry/config.yml

ro_name=registry-ro
ro-run:
	docker run -d -p 5000:5000 --restart=always 			\
		-v $(shell pwd)/mnt/auth_ro:/auth:ro				\
		-v $(shell pwd)/mnt/certs:/certs:ro					\
		-v $(shell pwd)/mnt/registry:/var/lib/registry:ro	\
		-e "REGISTRY_AUTH=htpasswd" 						\
		-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" 	\
		-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd		\
		-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/ca.crt 		\
		-e REGISTRY_HTTP_TLS_KEY=/certs/ca.key 				\
		--name=$(ro_name) registry:2

ro-start:
	docker start $(ro_name) || :

ro-stop:
	docker stop $(ro_name) || :

ro-restart: ro-stop ro-start

ro-rm: ro-stop
	docker rm $(ro_name) || :

ro-console:
	docker exec -it $(ro_name) /bin/sh

ro-log:
	docker logs $(ro_name)

