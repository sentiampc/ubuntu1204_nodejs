FROM shipimg/ubuntu1204_base:latest



# Install a default nodejs for the system
RUN add-apt-repository -y ppa:chris-lea/node.js && \
    apt-get update && \
	apt-get -y upgrade &&\
    apt-get install -yq nodejs \
	samba \
	gettext \
	ca-certificates \
	python-dev \
	curl;
	

RUN pip install awsebcli awscli;

# Force NVM_DIR so the installations go to the right place
ENV NVM_DIR /root/.nvm

# Install nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash

# Preinstall common node versions
#RUN . /root/.nvm/nvm.sh && nvm install 0.8;
#RUN . /root/.nvm/nvm.sh && nvm install 0.10;
#RUN . /root/.nvm/nvm.sh && nvm install 0.11;
RUN . /root/.nvm/nvm.sh && nvm install 0.12;
#RUN . /root/.nvm/nvm.sh && nvm alias default 0.12;


RUN npm install -g npm@v3.x-latest
RUN npm install gulpjs/gulp-cli#4.0 bower pm2 -g

CMD [ "node" ]
