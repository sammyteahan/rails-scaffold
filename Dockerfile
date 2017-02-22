FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

# For nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# For capybara
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# For nodejs runtime
RUN apt-get install -y nodejs

RUN mkdir /code
WORKDIR /code
ADD Gemfile /code/Gemfile
ADD Gemfile.lock /code/Gemfile.lock
RUN bundle install
ADD . /code

