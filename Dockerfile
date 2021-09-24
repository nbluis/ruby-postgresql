FROM ruby:2.6.8-buster

RUN apt-get update \
  && apt-get install -y postgresql postgresql-contrib nodejs npm sudo xvfb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -f -s /usr/share/zoneinfo/Brazil/East /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN service postgresql start \
    && sudo -u postgres psql postgres -c "ALTER ROLE postgres WITH PASSWORD 'postgres';" \
    && sudo -u postgres psql postgres -c "UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1'" \
    && sudo -u postgres psql postgres -c "DROP DATABASE template1;" \
    && sudo -u postgres psql postgres -c "CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF-8';" \
    && sudo -u postgres psql postgres -c "UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';" \
    && service postgresql stop
