FROM ubuntu
# For raspberry pi use:
# FROM resin/rpi-raspbian
RUN apt-get -y update
RUN apt-get -y install build-essential ruby-dev libpcap-dev iptables net-tools rubygems ruby1.9.1-dev git ruby-bundler
#Install stable
#RUN gem install bettercap
#Install latest
RUN cd /home
RUN git clone https://github.com/evilsocket/bettercap
RUN cd bettercap && bundle install
RUN gem build bettercap.gemspec
RUN gem install $(ls -*.gem)

ENV LANLOG /home/lanlog
RUN mkdir $LANLOG
RUN mkdir $LANLOG/log

COPY log.rb $LANLOG
VOLUME $LANLOG/log
RUN cd $LANLOG
ENTRYPOINT ["bettercap"]
#CMD ["-h"]

