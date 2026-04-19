FROM ruby:3.4-slim

WORKDIR /app

ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_WITHOUT=test

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libyaml-dev && \
    rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 4.0.10

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 80
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "80"]
