#!/bin/sh

if [ -z "$1" ]
  then
    echo "No particular argument supplied to fetch the metadata ...!!!"
    echo "Listing All the metadata details"
    curl -s "http://metadata.google.internal/computeMetadata/v1/instance/?&recursive=true&alt=json" -H "Metadata-Flavor: Google" | jq
else
    echo "fetching the metadata details for argument $1"
    curl -s "http://metadata.google.internal/computeMetadata/v1/instance/$1?&recursive=true&alt=json" -H "Metadata-Flavor: Google" | jq
fi