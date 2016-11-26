FROM trenpixster/elixir
MAINTAINER Joao Vazao Vasques Vasques

LABEL ai.jarvis.user_api.version="0.0.1"
LABEL vendor="Jarvis.ai"

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN mix compile

