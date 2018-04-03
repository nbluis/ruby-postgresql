FROM ruby:2.3.0 

RUN apt-get update \
  && apt-get install -y postgresql postgresql-contrib nodejs \
  && apt-get install sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD service postgresql start