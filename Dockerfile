FROM ruby:2.1.5

# Ensure everything is up to date
RUN apt-get update -qq

# Install the postgres client
RUN apt-get install -y postgresql-client

# Install node.js (javascript runtime for Ruby)
RUN apt-get install -y curl && \
     curl -sL https://deb.nodesource.com/setup | bash - && \
     apt-get install -y nodejs

# Install wkhtmltopdf
RUN cd /tmp && curl -L -O https://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.9.9-static-amd64.tar.bz2 && \
     tar jxf wkhtmltopdf-0.9.9-static-amd64.tar.bz2 && \
     chmod 777 wkhtmltopdf-amd64 && \
     mv wkhtmltopdf-amd64 /usr/local/bin/wkhtmltopdf

# Install phantom.js
RUN cd /tmp && curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 && \
     tar xjf /tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2 -C /tmp && \
     mv /tmp/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin

# Run the bundle install as part of the docker image so the dependencies are
# cached.
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /app
WORKDIR /app
