# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:latest

RUN mix local.hex --force \
 && mix archive.install --force hex phx_new 1.4.9 \
 && apt-get update \
 && curl -sL https://deb.nodesource.com/setup_10.x | bash \
 && apt-get install -y apt-utils \
 && apt-get install -y nodejs \
 && apt-get install -y build-essential \
 && apt-get install -y inotify-tools \
 && apt-get install -y postgresql-client \
 && mix local.rebar --force

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app
EXPOSE 4000

RUN mix local.hex --force

# RUN mix deps.get
# RUN cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development && cd ..
RUN mix do compile

CMD ["/app/entrypoint.sh"]
