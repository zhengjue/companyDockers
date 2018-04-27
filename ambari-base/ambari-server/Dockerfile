FROM lza/centos-jdk
MAINTAINER lza
RUN sed -ri 's/enabled=0/enabled=1/g' /etc/yum.repos.d/ambari.repo \
	&& sed -ri 's/enabled=0/enabled=1/g' /etc/yum.repos.d/hdp.repo \
	&& echo 192.168.1.178 bigdata16 >>/etc/hosts \
	&& yum install -y ambari-server \
	&& yum clean all \
	&& rm -rf /var/lib/yum
EXPOSE 8080 
