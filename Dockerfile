FROM ubuntu:16.04
MAINTAINER david@davidwelch.co

COPY ./startup.sh /startup.sh 

RUN export XDG_RUNTIME_DIR=/run/user/`id -u` \
  && apt-get update && apt-get install -y curl apt-transport-https \
  && curl -L https://packages.pganalyze.com/pganalyze_signing_key.asc | apt-key add - \
  && echo "deb [arch=amd64] https://packages.pganalyze.com/ubuntu/xenial/ stable main" > /etc/apt/sources.list.d/pganalyze_collector.list \
  && apt-get update \
  && apt-get install pganalyze-collector \
  && chmod a+x /startup.sh

CMD "/startup.sh"