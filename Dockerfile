FROM ruby:2.7.2

WORKDIR /app

ENV RAILS_ENV=production

ADD Gemfile* /app/
RUN bundle install

ADD . /app/

EXPOSE 80

CMD bundle exec rackup --host 0.0.0.0 --port 80
