#!/bin/sh
docker build . -t foo
mkdir -p build
docker run --rm --entrypoint cat foo  /home/application/function.zip > build/function.zip

sam local start-api -t sam.yaml -p 3000

