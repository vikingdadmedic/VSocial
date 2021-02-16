#!/usr/bin/env bash

FILE=apps/web-app/src/environments/generated-environment.ts

BUILD_TIME=`date --iso-8601=seconds`
#
# generate angular cli environment file
#
echo "// This file was generated by generate-environment.sh" > $FILE
echo "// Do not modify. Changes will be overwritten" >> $FILE
echo "export const CSD_MAIN_VERSION = '$CSD_MAIN_VERSION';" >> $FILE
echo "export const CSD_PROJECT_VERSION = '$CSD_PROJECT_VERSION';" >> $FILE
echo "export const CSD_BUILD_TIME = '$BUILD_TIME';" >> $FILE
