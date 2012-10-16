#!/bin/sh

cd client
brunch build client
cd ..

exec coffee server/server.coffee
