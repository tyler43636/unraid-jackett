FROM mono:4.2

MAINTAINER Tyler Payne <tyler43636@gmail.com>

# install jackett
RUN apt-get -q update && \
  apt-get install -qy wget libcurl4-openssl-dev bzip2 supervisor && \
  export JACKETTVER=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep -E \/tag\/ | awk -F "[><]" '{print $3}') && \
  wget --no-verbose -P /tmp https://github.com/Jackett/Jackett/releases/download/$JACKETTVER/Jackett.Binaries.Mono.tar.gz && \
  tar -xvf /tmp/Jackett* -C /opt && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add supervisor file for application
ADD jackett.conf /etc/supervisor/conf.d/

# add bash scripts
ADD scripts/*.sh /scripts/
RUN chmod +x /scripts/*.sh

# setup home directory so config files are kept in a volume
RUN usermod -m -d /config nobody && \
  mkdir /config

VOLUME /config

EXPOSE 9117

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/scripts/init.sh"]
