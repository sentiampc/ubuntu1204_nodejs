FROM shipimg/ubuntu1204_base:master.1

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl;

# Install a default nodejs for the system
RUN add-apt-repository -y ppa:chris-lea/node.js && \
    apt-get update && \
    apt-get install -y nodejs;

# Force NVM_DIR so the installations go to the right place
ENV NVM_DIR /root/.nvm

# Install nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash

# Preinstall common node versions
RUN . /root/.nvm/nvm.sh && nvm install 0.8;
RUN . /root/.nvm/nvm.sh && nvm install 0.10;
RUN . /root/.nvm/nvm.sh && nvm install 0.11;
RUN . /root/.nvm/nvm.sh && nvm alias default 0.10;

CMD [ "node" ]
