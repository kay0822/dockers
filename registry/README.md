# 设计思路
分为两个容器，公用一个registry存储，一个用来写，另一个只读，用来提供给用户
密码：
ro: weifuinfo / weifuinfo.com
rw: weifuinfo / fXXXXXd.weifuinfo.com  (XXXXX需要自己想象)

# referenced from
https://docs.docker.com/registry/deploying/

# generate htpasswd
docker run --entrypoint htpasswd registry:2 -Bbn testuser testpassword > mnt/auth/htpasswd

# generate crt & key
openssl req -newkey rsa:2048 -nodes -keyout domain.key -x509 -days 3650 -out domain.crt


# 客户如何使用
在客户的docker上做以下操作：
1. vi /etc/default/docker
DOCKER_OPTS="--insecure-registry <yoursite.com>:<port>"  
2. 将ca.crt放到/etc/docker/certs.d/<yoursite.com>:<port>/下


