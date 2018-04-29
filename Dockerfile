FROM ruby:2.5.0
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g n && \
    n stable && \
    npm install -g yarn && \
    mkdir /app && \
     echo 'alias be="bundle exec"' >> ~/.bashrc; \
     echo " \n\
     if defined?(PryByebug) \n\
        Pry.commands.alias_command 's', 'step' \n\
        Pry.commands.alias_command 'n', 'next' \n\
        Pry.commands.alias_command 'f', 'finish' \n\
        Pry.commands.alias_command 'c', 'continue' \n\
     end" >> ~/.pryrc

WORKDIR /app
# COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock
# RUN bundle install
# COPY . /app
