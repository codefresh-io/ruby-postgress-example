#!/usr/bin/env bash

set -e
cd /usr/app/dir/

export MONGODB_AUTH="$(date | md5sum | awk '{print $1}')"
export MONGO_DB="ruby_postgress_example_development"
export MONGO_URI="mongodb://$CF_USER_NAME:$MONGODB_AUTH@localhost:27017/$MONGO_DB"
echo "export MONGODB_AUTH=$MONGODB_AUTH" >> mongo_conn.sh
echo "export MONGO_DB=$MONGO_DB" >> mongo_conn.sh
echo "export MONGO_URI=$MONGO_URI" >> mongo_conn.sh
echo "check $(pwd)/mongo_conn.sh for mongo connection environment variables";

bash -il /opt/codefresh/mongo/launch-mongo.sh
bash -il /opt/codefresh/mongo/init-mongo.sh