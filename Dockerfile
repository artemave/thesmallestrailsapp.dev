FROM ruby:2.7.2

WORKDIR /app

ADD Gemfile* /app/
RUN bundle install

ADD . /app/

CMD bundle exec rackup --host 0.0.0.0
