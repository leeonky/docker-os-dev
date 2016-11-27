FROM daocloud.io/leeonky/centos-7

USER root

###### install basic tools
RUN yum -y install \
	net-tools.x86_64 \
	openssh-clients.x86_64 \
	bash-completion \
	wget \
	unzip.x86_64

###### install basic development tools
RUN yum -y groupinstall 'Development Tools'

###### install git and config
RUN yum -y install \
	zlib-devel \
	perl-ExtUtils-MakeMaker

RUN wget https://www.kernel.org/pub/software/scm/git/git-2.10.2.tar.gz && \
	tar -zxf git-2.10.2.tar.gz && \
	cd git-2.10.2 && \
	./configure && \
	make && \
	make install && \
	cd ../ && \
	rm -rf git-2.10.2*

ADD .gitignore_global $DEV_HOME/
RUN git config --global color.ui true && \
	git config --global user.email "leeonky@gmail.com" && \
	git config --global user.name 'leeonky' && \
	git config --global core.excludesfile ~/.gitignore_global

###### install docker client
RUN yum -y install docker
