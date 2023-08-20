#!/usr/bin/env bash
# exit on error
ser -o errexit

bundle install

bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
