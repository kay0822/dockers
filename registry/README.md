# referenced from
https://docs.docker.com/registry/deploying/

# generate htpasswd
docker run --entrypoint htpasswd registry:2 -Bbn testuser testpassword > mnt/auth/htpasswd

# generate crt & key
openssl req -newkey rsa:2048 -nodes -keyout domain.key -x509 -days 3650 -out domain.crt

