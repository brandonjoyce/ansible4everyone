FROM ruby:2.3

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

# Java for s3_website tool
RUN apt-get install -y openjdk-7-jre

ENV RAILS_ENV production
ENV RACK_ENV production
ENV APP_HOME /cms
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

RUN bundle install
RUN bundle exec rake assets:precompile
EXPOSE 3000

CMD bundle exec puma -p 3000 -C config/puma.rb
