#!/bin/sh

if [[ -z ${SERVICE_NAME} || -z ${COMMIT_SHA} ]];
then
  echo "SERVICE_NAME=$WERCKER_DEPLOY_TO_STAGING_SERVICE_NAME"
  echo "COMMIT_SHA=$WERCKER_DEPLOY_TO_STAGING_COMMIT_SHA"
fi

if [[ -z ${DEPLOYBOT_SERVICE_URL} ]];
then
  echo "Deploy bot service url is required."
  exit
fi

curl "${DEPLOYBOT_SERVICE_URL}/${WERCKER_DEPLOY_TO_STAGING_SERVICE_NAME}" -H "Content-Type: application/json" -d '{"hash":"'"${WERCKER_DEPLOY_TO_STAGING_COMMIT_SHA}"'"}'