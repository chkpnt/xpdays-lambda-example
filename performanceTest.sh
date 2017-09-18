#!/usr/bin/env bash

if [ -z "${API_GATEWAY_ID}" ]; then
    echo "Please set environment variable API_GATEWAY_ID"
    exit 1
fi

for i in `seq 1 200`; do

curl -XPOST -i -s -d  "{\"username\":\"user\",\"message\": \"msg${i}\"}" \
                   "https://${API_GATEWAY_ID}.execute-api.eu-central-1.amazonaws.com/LATEST/chat" 

done                   

echo "Finished."
