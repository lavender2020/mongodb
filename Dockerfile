# Pull base image.
FROM localhost:5000/ubuntu:latest

# Install MongoDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-10gen && \
  rm -rf /var/lib/apt/lists/*
  
# Add config file
ADD mongodb.conf /etc/mongodb.conf

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["mongod"]

# Expose ports.
EXPOSE 27017
EXPOSE 28017
