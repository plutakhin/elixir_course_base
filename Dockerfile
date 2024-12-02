FROM elixir:1.17.3-otp-27 as runtime

WORKDIR /app

COPY mix.exs mix.lock /app/
RUN mix deps.get && \
    mix deps.compile

COPY . /app

EXPOSE 4000