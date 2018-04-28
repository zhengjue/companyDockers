FROM ubuntu  
MAINTAINER lza
RUN mkdir -p /app  
WORKDIR /app  
ADD requirements.txt requirements.txt
COPY sources.list /etc/apt/sources.list
RUN apt-get update \
	&&  apt-get install -y python \
                       python-dev \
                       python-pip \
                       ipython \
                       libmysqlclient-dev \
	&& python -m pip install --upgrade pip  \
	&& pip install -r requirements.txt \
  	&& apt-get clean \
    	&& apt-get autoclean \
    	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

EXPOSE 80
CMD ["bash"]  
