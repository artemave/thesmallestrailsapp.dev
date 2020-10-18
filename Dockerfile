FROM ruby:2.7.2

WORKDIR /app

ADD Gemfile* /app/
RUN bundle install

ADD . /app/

EXPOSE 9292

CMD bundle exec rackup --host 0.0.0.0
