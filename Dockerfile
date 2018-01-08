FROM leeonky/ubuntu-1604

USER root

###### install basic tools
#skip deltarpm
RUN apt-get install -y \
	net-tools \
	iputils-ping \
	dpkg-dev \
	openssh-client \
	bash-completion \
	wget \
	zip \
	unzip \
	dos2unix \
	which \
	jq && \
	apt-get clean

###### install git and config
RUN apt-get -y install \
	zlib1g-dev \
	gettext && \
	apt-get clean && \
	wget https://github.com/leeonky/tools_dev/raw/master/git-2.10.2.tar.gz && \
	tar -zxf git-2.10.2.tar.gz && \
	cd git-2.10.2 && \
	./configure && \
	make -j4 && \
	make install && \
	cd ../ && \
	rm -rf git-2.10.2*

###### install docker client
RUN install-docker

###### load dot files
USER $USER_NAME
