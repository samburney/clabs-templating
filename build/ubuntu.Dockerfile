FROM library/ubuntu:latest

LABEL maintainer="Sam Burney <sburney@sifnt.net.au>"

RUN apt-get update && \
    apt-get upgrade -fy && \
    apt-get install -fy iproute2 net-tools iputils-ping traceroute && \
    apt-get clean && \
    rm -rf /var/cache/apt
