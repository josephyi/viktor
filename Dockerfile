FROM elixir:1.4.1

RUN mix local.hex --force && \
    mix local.rebar --force

VOLUME ["/src"]
WORKDIR /src
