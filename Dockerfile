FROM ubuntu:14.04

# allows the use of the 'source' command. 
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    software-properties-common \
    apt-transport-https \
    build-essential \
    ca-certificates \
    vim \
    git \
    curl \ 
    wget \
 && rm -rf /var/lib/apt/lists/*

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.5.0

ADD nvm-install.sh /tmp/

RUN bash /tmp/nvm-install.sh \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm install -g grunt-cli \
    && npm install -g yarn \
    && npm install -g brunch 

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

EXPOSE 9485

CMD ["/bin/bash"]


