FROM lza/ubuntu-jdk
MAINTAINER lza
ADD hadoop-2.7.3.tar.gz /opt/ 
COPY config/* /tmp/
ENV HADOOP_HOME /opt/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH
RUN mv /opt/hadoop-2.7.3 /opt/hadoop \
	&& mkdir -p ~/hdfs/namenode \
	&& mkdir -p ~/hdfs/datanode \
   	&& mkdir $HADOOP_HOME/logs \
	&& mv /tmp/ssh_config ~/.ssh/config  \
	&& mv /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh  \
	&& mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml  \
	&& mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml  \
	&& mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml \
	&& mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml \
	&& mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves \
	&& mv /tmp/start-hadoop.sh ~/start-hadoop.sh \
	&& mv /tmp/run-wordcount.sh ~/run-wordcount.sh \
	&& chmod +x ~/start-hadoop.sh \
    	&& chmod +x ~/run-wordcount.sh \
    	&& chmod +x $HADOOP_HOME/sbin/start-dfs.sh \
    	&& chmod +x $HADOOP_HOME/sbin/start-yarn.sh \
	&& $HADOOP_HOME/bin/hdfs namenode -format \
	&& rm -rf /var/lib/apt/lists/* 
