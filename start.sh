#!/bin/bash

docker run -t -i -h mail.theoria.me -p 25:25 -p 993:993 \
    -e USER_NAME=$1 -e USER_PASSWORD=$2 email /bin/bash
