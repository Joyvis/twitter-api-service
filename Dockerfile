FROM ruby:2.5.0
MAINTAINER jjs276@gmail.com

ARG RAILS_PORT

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

RUN mkdir -p /twitter_api_service
WORKDIR /twitter_api_service

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE $RAILS_PORT

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
