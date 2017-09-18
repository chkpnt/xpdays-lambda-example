#!/usr/bin/env bash

if [ -z "${API_GATEWAY_ID}" ]; then
    echo "Please set environment variable API_GATEWAY_ID"
    exit 1
fi
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters. First param has to be the username, second param is message."
    exit 1
fi

echo -e "\nSending message .."
responseCode=$(curl -XPOST \
                   -sw '%{http_code}' \
                   -d "{\"username\":\"${1}\",\"message\": \"${2}\"}" \
                   "https://${API_GATEWAY_ID}.execute-api.eu-central-1.amazonaws.com/LATEST/chat" \
                   -o /dev/null \
              )
echo "ResponseCode: ${responseCode}"
if [ ${responseCode} -eq 200 ]; then
    echo -e "Send message successfully .."
else
    echo -e "Sending message failed .."
    exit 2
fi
