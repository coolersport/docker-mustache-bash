#!/bin/bash
# ensure it runs off the right directory
cd /data

if [[ ! $# -eq 1 ]] ; then
    echo 'Please specify an environment as a single argument, e.g. docker run coolersport/mustache-bash env-gcp'
    exit 1
fi

ENV=$1

if [[ -f .$ENV.yml ]]; then
    ENVFILE=.$ENV.yml
elif [[ -f .$ENV ]]; then
    # backward compatibility
    ENVFILE=.$ENV
else
    echo Environment file .${ENV}.yml not found.
    exit 2
fi

mkdir -p `pwd`/$ENV
for f in `ls *.yml`
do
  mustache $ENVFILE $f > $ENV/$f
done
