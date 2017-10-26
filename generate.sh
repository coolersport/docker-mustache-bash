#!/bin/bash
# ensure it runs off the right directory
cd /data

if [[ ! $# -eq 1 ]] ; then
    echo 'Please specify an environment as a single argument, e.g. docker run coolersport/mustache-bash env-gcp'
    exit 1
fi

ENV=$1

if [[ ! -f .$ENV ]] ; then
    echo Environment file .${ENV} not found.
    exit 2
fi

mkdir -p `pwd`/$ENV
for f in `ls *.yml`
do
  mustache .$ENV $f > $ENV/$f
done
