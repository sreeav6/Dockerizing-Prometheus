#Use ubuntu as a base image
FROM ubuntu:latest

#Set the maintainer label
LABEL maintainer="sreeav"

#Avoid interactive prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

#Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

#Install prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.53.1/prometheus-2.53.1.linux-amd64.tar.gz \
&& tar xvfz prometheus-2.53.1.linux-amd64.tar.gz \
&& mv prometheus-2.53.1.linux-amd64 /usr/local/prometheus \
&& rm prometheus-2.53.1.linux-amd64.tar.gz

#setting up the prometheus config file
COPY prometheus.yml /usr/local/prometheus/prometheus.yml

#Expose the port on which prometheus will run
EXPOSE 9090

#Start prometheus
CMD ["/usr/local/prometheus/prometheus", "--config.file=/usr/local/prometheus/prometheus.yml", "--web.listen-address=:9090"]
