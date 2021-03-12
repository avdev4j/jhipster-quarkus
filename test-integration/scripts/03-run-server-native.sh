#!/bin/bash

set -e
if [[ -a $(dirname $0)/00-init-env.sh ]]; then
    source $(dirname $0)/00-init-env.sh
else
    echo "*** 00-init-env.sh not found, relying on JHI_* en vars"
fi

#-------------------------------------------------------------------------------
# Run server test
#-------------------------------------------------------------------------------
cd "$JHI_FOLDER_APP"
if [ -f "mvnw" ]; then
    ./mvnw verify -Pwebpack,native
elif [ -f "gradlew" ]; then
    ./gradlew test integrationTest -x webpack
fi
