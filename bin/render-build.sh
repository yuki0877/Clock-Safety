#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset
bundle exec rake db:seed
