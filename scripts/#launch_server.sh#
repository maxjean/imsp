#! /bin/sh
DIR=$(dirname $0)
cd $DIR/..
DIR=$(pwd)
pg_ctl -D /usr/local/var/postgres/ -l /usr/local/var/postgres/server.log start

bundle exec rails server -b 0.0.0.0 -p 3000