FROM ruby:2.3

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN apt-get install -y nodejs

ENV RAILS_ENV production
ENV RACK_ENV production
ENV APP_HOME /cms
EXPOSE 3000

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME
RUN bundle install
RUN bundle exec rake assets:precompile

ENTRYPOINT ./entrypoint.sh
