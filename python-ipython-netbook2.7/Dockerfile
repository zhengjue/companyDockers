FROM ubuntu  
MAINTAINER lza
RUN mkdir -p /app  
WORKDIR /app  
ADD requirements.txt requirements.txt
COPY docker-entrypoint.sh /usr/local/bin/
COPY sources.list /etc/apt/sources.list
RUN apt-get update \
	&&  apt-get install -y python \
                       python-dev \
                       python-pip \
	&& python -m pip install --upgrade pip  \
	&& pip install -r requirements.txt \
	&& pip install jupyter \
  	&& apt-get clean \
    	&& apt-get autoclean \
    	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

EXPOSE 8888
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]  
