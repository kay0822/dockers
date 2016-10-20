FROM ubuntu:16.04

RUN apt-get update				&& \
	apt-get install -y mongodb

#RUN sed -i 's/#noprealloc = true/noprealloc = true/' /etc/mongodb.conf 

COPY data/ /




RUN sed -i -re 's/^app\.secret=.*$/app\.secret=iamchanged/' /leanote/conf/app.conf

VOLUME /var/lib/mongodb
EXPOSE 9000

CMD /entrypoint.sh

