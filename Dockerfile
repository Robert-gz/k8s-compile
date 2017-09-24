FROM ubuntu:16.04  
RUN  apt-get update && \
 	apt-get install   -y  apt-transport-https     ca-certificates  wget   curl     software-properties-common && \
	apt-get   clean
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-get update && \
 	    apt-key fingerprint 0EBFCD88 && \
 	    add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" 
RUN apt-get update && \
	apt-get install -y docker-ce && \
 	 apt-get   clean
VOLUME /var/lib/docker	 
RUN wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xf go1.8.3.linux-amd64.tar.gz
ADD ./k8s-compile.sh /k8s-compile.sh
CMD /k8s-compile.sh
