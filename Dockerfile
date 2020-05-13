FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

# Install prerequisites
RUN apt-get update && apt-get install -y \
    apt-utils \
    build-essential \
    curl \
    git \
    locales \
    pkg-config \
    sudo \
    udev \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install node12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash \
    && apt-get update && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Generating locales
RUN sed -i 's/^# *\(de_DE.UTF-8\)/\1/' /etc/locale.gen \
    && sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen

RUN mkdir -p /opt/scripts/ \
    && mkdir -p /opt/userscripts/ \
    && chmod 777 /opt/scripts/ \
    && chmod 777 /opt/userscripts/
WORKDIR /opt/scripts/
COPY scripts/start.sh start.sh
RUN chmod +x start.sh

WORKDIR /opt/userscripts
ENV DEBIAN_FRONTEND="teletype"

ENTRYPOINT ["/bin/bash", "-c", "/opt/scripts/start.sh"]

