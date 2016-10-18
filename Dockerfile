FROM ubuntu
# For raspberry pi use:
# FROM resin/rpi-raspbian
RUN apt-get -y update
RUN apt-get -y install build-essential ruby-dev libpcap-dev iptables net-tools
RUN gem install bettercap

ENV LANLOG /home/lanlog
RUN mkdir $LANLOG
RUN mkdir $LANLOG/log

COPY log.rb $LANLOG
VOLUME $LANLOG/log
RUN cd $LANLOG
ENTRYPOINT ["bettercap"]
#CMD ["-h"]

