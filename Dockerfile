FROM ruby:2.6.3

# Install ruby-debug-ide and debase
RUN gem install ruby-debug-ide
RUN gem install debase

# To install the latest version of bundler
RUN gem install bundler:2.0.1

COPY Gemfile /root/
COPY Gemfile.lock /root/
RUN cd /root/ && bundle install

# Install git, process tools
RUN apt-get update && apt-get -y install git procps

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Set the default shell to bash instead of sh
ENV SHELL /bin/bash