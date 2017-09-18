#!/usr/bin/env bash

if [ -z "${API_GATEWAY_ID}" ]; then
    echo "Please set environment variable API_GATEWAY_ID"
    exit 1
fi

echo -e "\nReading messages .."
curl "https://${API_GATEWAY_ID}.execute-api.eu-central-1.amazonaws.com/LATEST/chat"
