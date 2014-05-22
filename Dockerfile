# Pull lean base image.
FROM debian:wheezy

MAINTAINER Kyle Manna <kmanna@fanhattan.com>

RUN apt-get update && apt-get install -y dnsmasq

# Install helpers
ADD https://raw.githubusercontent.com/jpetazzo/pipework/master/pipework /usr/bin/
ADD dnsmasq-wrapper /usr/bin/

RUN chmod a+x /usr/bin/pipework /usr/bin/dnsmasq-wrapper

# Wrapper helps with pipework
ENTRYPOINT ["dnsmasq-wrapper"]

# Define default command.
CMD ["--dhcp-range=192.168.0.10,192.168.0.99,255.255.255.0", \
     "--dhcp-option=option:router,192.168.0.1"]
