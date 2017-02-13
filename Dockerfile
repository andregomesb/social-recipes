FROM ruby:2.3

RUN apt-get update
RUN apt-get install nodejs -y
RUN mkdir -p /var/www/social-recipes
WORKDIR /var/www/social-recipes
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . /var/www/social-recipes

CMD 'rails server -b 0.0.0.0'
