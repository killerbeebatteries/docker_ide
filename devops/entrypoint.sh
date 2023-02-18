#!/bin/bash

set -u
set -e

GCLOUD_PROJECT=${GCLOUD_PROJECT:-}
GKE_CLUSTER=${GKE_CLUSTER:-invalid_cluster_please_set_env_var}
GKE_REGION=${GKE_REGION:-invalid_region_please_set_env_var}

# setup kubectl context
if [ -n "${GCLOUD_PROJECT}" ]; then
  gcloud container clusters get-credentials "${GKE_CLUSTER}" \
    --region="${GKE_REGION}"
fi

# use our data directory
if [ -d "/data" ]; then
  cd /data
fi

exec "$@"
