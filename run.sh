#!/bin/bash

if [[ -z ${DEPLOYBOT_SERVICE_URL} || -z ${SERVICE_NAME} || -z ${COMMIT_SHA} ]];
then
  echo "Each of these variables are required: DEPLOYBOT_SERVICE_URL, SERVICE_NAME and COMMIT_SHA"
  exit
fi

curl "${DEPLOYBOT_SERVICE_URL}/${SERVICE_NAME}" -H "Content-Type: application/json" -d '{"hash":"'"${COMMIT_SHA}"'"}'