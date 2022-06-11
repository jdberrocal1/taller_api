FROM ruby:2.7.6
RUN apt-get install tzdata
RUN cp /usr/share/zoneinfo/US/Central /etc/localtime
RUN echo "US/Central" > /etc/timezone

RUN apt-get update \
    && apt-get install -y git libmariadb-dev mariadb-client libxml2-dev libxslt-dev  \
    && rm -rf /var/lib/apt/lists/*
COPY Gemfile Gemfile.lock /app/
WORKDIR /app
RUN bundle install
COPY . /app/
