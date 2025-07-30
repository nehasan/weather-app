FROM ruby:3.2-bullseye

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips postgresql-client libpq-dev tzdata && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN mkdir -p /app
COPY ./Gemfile /app
COPY ./Gemfile.lock /app
WORKDIR /app

RUN bundle install

COPY . .
RUN chmod +x /app/entrypoint.sh
RUN ls -la
RUN ls -la /app
EXPOSE 3000
ENTRYPOINT [ "/app/entrypoint.sh" ]