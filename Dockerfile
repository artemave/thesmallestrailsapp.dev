FROM rails:4.2.3

WORKDIR /app

ADD Gemfile* /app/
RUN bundle install --without test

ADD . /app/

EXPOSE 9292

CMD bundle exec rackup --host 0.0.0.0
