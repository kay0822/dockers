FROM ubuntu:16.04
ENV VERSION 3.1.19

RUN apt-get update -y															&& \
	apt-get install -y wget zip python

RUN cd /opt/																	&& \
	wget -O xxnet.zip https://codeload.github.com/XX-net/XX-Net/zip/$VERSION	&& \
	unzip xxnet.zip																&& \
	mv [xX][xX]-[nN][eE][tT]* xxnet

COPY data/ /

EXPOSE 8085 8086 8087
CMD /opt/xxnet/start

