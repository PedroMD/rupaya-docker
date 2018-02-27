FROM ubuntu:14.04
LABEL maintainer="Pedro Lobo <https://github.com/pslobo>"
LABEL Name="Rupaya Daemon"
LABEL Version="4.0"

ADD ./docker_entrypoint.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/docker_entrypoint.sh && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install wget \
					unzip \
					libboost-all-dev \
					libevent-dev \
					libzmq3 \
					libminiupnpc-dev \
					software-properties-common -y && \
	add-apt-repository ppa:bitcoin/bitcoin -y && \
	apt-get update && \
	apt-get install libdb4.8-dev \
					libdb4.8++-dev -y && \
	wget https://github.com/rupaya-project/rupaya/releases/download/v4.0.0.0/rupaya-4.0.0-ubuntu14.04.zip && \
	unzip rupaya-4.0.0-ubuntu14.04.zip && \
	mv rupayad rupaya-cli /usr/local/bin && \
	rm rupaya-4.0.0-ubuntu14.04.zip && \
	mkdir /rupaya

EXPOSE 9020
VOLUME /rupaya
WORKDIR /rupaya

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]