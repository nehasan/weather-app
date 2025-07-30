#!/bin/bash

rm -rf /app/tmp/pids/server.pid
bundle install
bundle exec rails db:migrate
bundle exec rails server -b '0.0.0.0' -e development