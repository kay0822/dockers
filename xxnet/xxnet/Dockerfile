FROM ubuntu:16.04
ENV VERSION 3.3.0

RUN apt-get update -y															&& \
	apt-get install -y wget zip python

COPY data/ /

RUN cd /opt/	&& \
	if ! test -f xxnet.zip;then wget -O xxnet.zip https://codeload.github.com/XX-net/XX-Net/zip/$VERSION;fi	&& \
	unzip xxnet.zip																&& \
	mv [xX][xX]-[nN][eE][tT]* xxnet


EXPOSE 8085 8086 8087
CMD /opt/xxnet/start

