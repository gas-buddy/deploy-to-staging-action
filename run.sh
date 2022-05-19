#!/bin/bash

if [[ -z ${DEPLOYBOT_SERVICE_URL} || -z ${SERVICE_NAME} || -z ${COMMIT_SHA} || -z ${BUILD_ID} ]];
then
  echo "Each of these variables are required: DEPLOYBOT_SERVICE_URL, SERVICE_NAME, COMMIT_SHA and BUILD_ID"
  exit
fi

curl "${DEPLOYBOT_SERVICE_URL}/${SERVICE_NAME}" -H "Content-Type: application/json" -d '{"hash":"'"${COMMIT_SHA}"'", "build_id":"'"${BUILD_ID}"'"}'
