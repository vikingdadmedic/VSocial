#!/usr/bin/env bash

#################
# beta
#################

export CSD_CURRENT_TARGET=prod

# import common variables (they already need the CPB_CURRENT_TARGET var)
source ./conf/envs/common_env.sh

export CSD_DOMAIN_NAME=staging.$CSD_DOMAIN_NAME

# website
# ------------------------------------------------------------------------------
export CSD_WEBSITE_DOMAIN_NAME=www.$CSD_DOMAIN_NAME
export CSD_WEBSITE_PUBLIC_HOST=$CSD_WEBSITE_DOMAIN_NAME


# webapp
# ------------------------------------------------------------------------------
export CSD_WEBAPP_DOMAIN_NAME=app.$CSD_DOMAIN_NAME
export CSD_WEBAPP_PUBLIC_HOST=$CSD_WEBAPP_DOMAIN_NAME


# webapp-server
export CSD_WEBAPP_SERVER_WEBAPP_DJANGO_SETTINGS_MODULE=config.settings.production
export CSD_WEBAPP_SERVER_WEBAPP_MAKEMIGRATIONS=true
# redundantly needed because we override the domain name for this env also here in this file
export CSD_WEBAPP_SERVER_ALLOWED_HOSTS=".$CSD_DOMAIN_NAME,.$CSD_WEBAPP_PUBLIC_HOST,$CSD_WEBAPP_SERVER_WEBAPP_HOST"
export CSD_WEBAPP_SERVER_WEBAPP_DJANGO_EMAIL_BACKEND=${CSD_WEBAPP_SERVER_WEBAPP_DJANGO_EMAIL_BACKEND:-django.core.mail.backends.smtp.EmailBackend}

### AWS
export CSD_WEBAPP_SERVER_WEBAPP_AWS_ACCESS_KEY_ID=
export CSD_WEBAPP_SERVER_WEBAPP_AWS_SECRET_ACCESS_KEY=
export CSD_WEBAPP_SERVER_WEBAPP_AWS_STORAGE_BUCKET_NAME=
export CSD_AWS_ECR=true

#k8s
export CSD_K8S_INGRESS_LETSENCRYPT=true

export CSD_WEBAPP_CDN_DOMAIN_NAME=cdn.$CSD_DOMAIN_NAME

# If beta cluster is on hetzner Hetzner
export CSD_K8S_ENABLE_HETZNER_STORAGE_CLASS=true
export CSD_K8S_DEFAULT_STORAGE_CLASS="hcloud-volumes"

# Backup
export CSD_BACKUP_AWS_S3_ENDPOINT_URL="http://"$CSD_WEBAPP_SERVER_MINIO_HOST:$CSD_WEBAPP_SERVER_MINIO_PORT