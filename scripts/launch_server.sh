#! /bin/sh
DIR=$(dirname $0)
cd $DIR/..
DIR=$(pwd)
pg_ctl -D /usr/local/var/postgres/ -l /usr/local/var/postgres/server.log start
RAILS_ENV=development bundle exec rake assets:precompile --trace
bundle exec rails server