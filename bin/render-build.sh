#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:seed
