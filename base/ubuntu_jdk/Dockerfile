FROM ubuntu
MAINTAINER lza
COPY sources.list /etc/apt/sources.list  
ADD jre.tar.gz /opt/jdk/
RUN apt-get clean \
	&& apt-get update \
	&& apt-get install  -y openssh-server  \
	&& sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config  \
	&& sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config  \
	&& echo root:centos | chpasswd \
	&& ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' \
        && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
	#&& rm -f  /etc/ssh/ssh_host_dsa_key  \
	#&& rm -f  /etc/ssh/ssh_host_rsa_key  \
	#&& ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key  \
	#&& ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key  \
	&& mkdir /var/run/sshd \
	&& apt-get autoremove \
	&& apt-get autoclean \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* 
ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH
EXPOSE 22  
#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
CMD ["/usr/sbin/sshd", "-D"]
