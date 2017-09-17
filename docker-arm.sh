#!/bin/bash

tag='xshill/arm'
docker run --rm -it -v $(pwd):/work -u $UID:$UID $@ $tag
