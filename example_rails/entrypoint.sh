#!/usr/bin/env bash

set -e

bundle exec rake db:create db:migrate
bundle exec puma -C config/puma.rb
