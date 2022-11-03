FROM elixir:1.14.1-alpine

# Build Args
ARG PHOENIX_VERSION=1.6.15

# Alpine Packages
RUN \
    apk update && \
    apk --no-cache --update add \
      make \
      g++ \
      wget \
      curl \
      inotify-tools

# Phoenix
RUN mix local.hex --force
RUN mix archive.install --force hex phx_new #{PHOENIX_VERSION}
RUN mix local.rebar --force

# App Directory
ENV APP /app
RUN mkdir -p $APP
WORKDIR $APP
