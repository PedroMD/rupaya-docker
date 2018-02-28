FROM ubuntu:14.04
LABEL maintainer="Pedro Lobo <https://github.com/pslobo>"
LABEL Name="Rupaya CLI"
LABEL Version="4.0"

ADD ./docker_entrypoint.sh /usr/local/bin/

RUN export BUILD_DEPS="wget \
						unzip \
						software-properties-common" \

	&& apt-get update && apt-get upgrade -qqy  \
    && apt-get install --no-install-recommends -qqy \
		${BUILD_DEPS} \
		libboost-all-dev \
		libevent-dev \
		libzmq3 \
		libminiupnpc-dev \
	
	&& add-apt-repository ppa:bitcoin/bitcoin -y \
	&& apt-get update \
	&& apt-get install --no-install-recommends -qqy \
		libdb4.8-dev \
		libdb4.8++-dev -y \
	
	&& wget https://github.com/rupaya-project/rupaya/releases/download/v4.0.0.0/rupaya-4.0.0-ubuntu14.04.zip \
	&& unzip rupaya-4.0.0-ubuntu14.04.zip \
	&& mv rupayad rupaya-cli /usr/local/bin \
	&& rm rupaya-4.0.0-ubuntu14.04.zip \
	&& chmod a+x /usr/local/bin/docker_entrypoint.sh \
	
	&& apt-get --auto-remove purge -qqy ${BUILD_DEPS} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

	

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]