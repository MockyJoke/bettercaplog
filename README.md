# bettercaplog

### Usage:

docker build -t lanlog .

docker run -it --privileged --net=host lanlog -X -I eth0

OR logging http requests only

docker run -d --privileged --net=host -v ~:/home/lanlog/log lanlog --proxy-module /home/lanlog/log.rb -I eth0 --no-sslstrip

####Options

-v : map log output dir on predifined volume: /home/lanlog/log

--proxy-module /home/lanlog/log.rb : use provided dummy logging module

-I : choose working dir

--no-sslstrip : disable sslstrip

-T : List target IPs, seperated by comma. Example : "-T 192.168.1.50,192.168.1.60"

-X : Enable http proxy

More options on: https://www.bettercap.org/docs/main.html

### Attach to container:

docker exec -i -t container_id /bin/bash
