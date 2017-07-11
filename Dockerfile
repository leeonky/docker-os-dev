FROM leeonky/centos-7

USER root

###### install basic tools
RUN yum -y install \
	net-tools.x86_64 \
	openssh-clients.x86_64 \
	bash-completion \
	wget \
	unzip.x86_64 \
	dos2unix \
	jq \
	deltarpm

###### install basic development tools
RUN yum -y groupinstall 'Development Tools'

###### install git and config
RUN yum -y install \
	zlib-devel \
	perl-ExtUtils-MakeMaker \
	curl-devel

RUN wget https://github.com/leeonky/tools_dev/raw/master/git-2.10.2.tar.gz && \
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
