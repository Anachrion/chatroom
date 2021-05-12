# syntax=docker/dockerfile:1
FROM ruby:2.6.2
RUN apt-get update -qq && apt-get install -y nodejs && \
    gem install bundler:2.2.5

WORKDIR /chatroom
COPY Gemfile /chatroom/Gemfile
COPY Gemfile.lock /chatroom/Gemfile.lock
RUN bundle install

# Prepare nodejs 12.x and yarn package installation
RUN apt-get update && apt-get install -y --no-install-recommends curl gnupg ca-certificates apt-transport-https && \
   curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
   echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
   curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
   echo "deb https://deb.nodesource.com/node_12.x stretch main" > /etc/apt/sources.list.d/nodesource.list && \
   apt-get update && apt-get install -y --no-install-recommends yarn nodejs


# Install yarn packages
COPY package.json yarn.lock /chatroom/
RUN cd /chatroom && yarn --frozen-lockfile install

COPY . /chatroom

EXPOSE 3000

# Configure the main process to run when running the image
CMD bundle exec rails server -b 0.0.0.0
