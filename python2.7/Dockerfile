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
<<<<<<< HEAD
                       ipython \
                       libmysqlclient-dev \
=======
>>>>>>> 5fff64b8113ac31e15c541858299f7ca30f71ba4
	&& python -m pip install --upgrade pip  \
	&& pip install -r requirements.txt \
  	&& apt-get clean \
    	&& apt-get autoclean \
    	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

EXPOSE 80
CMD ["bash"]  
