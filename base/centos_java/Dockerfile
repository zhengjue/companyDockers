FROM centos
MAINTAINER lza
ADD ./jdk-8u144-linux-x64.tar.gz /opt
COPY ./ambari.repo /etc/yum.repos.d/
COPY ./hdp.repo /etc/yum.repos.d/
COPY config/* /tmp/
ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH
RUN mv /opt/jdk1.8.0_144 /opt/jdk \
	&& sed -ri 's/enabled=0/enabled=1/g' /etc/yum.repos.d/ambari.repo \
        && sed -ri 's/enabled=0/enabled=1/g' /etc/yum.repos.d/hdp.repo \
        && echo 192.168.1.178 bigdata16 >>/etc/hosts \
	&& yum install  -y openssh-server openssh-clients \
	&& sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config \
	&& echo "root:centos" | chpasswd \
	&& sshd-keygen -A \
	# 等同 如下三条
	#&& ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''   \
	#&& ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
	#&& ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N '' \
	&& ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
	&& cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
	&& mv /tmp/ssh_config /etc/ssh/ssh_config  \
	&& mkdir /var/run/sshd \
	&& yum clean all \
	&& rm -rf /var/lib/yum
	
EXPOSE 22  
CMD ["/usr/sbin/sshd", "-D"]
