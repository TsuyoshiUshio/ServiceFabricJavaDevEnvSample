#!/bin/bash
set -x
azure servicefabric application delete fabric:/SfTestApplication > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Application removal failed."
    exit 1
fi
version=`grep "ApplicationTypeVersion" SfTestApplication/ApplicationManifest.xml | cut -d'=' -f2 | sed -e 's/^"//'  -e 's/"$//' `
azure servicefabric application type unregister SfTestApplicationType $version > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Unregistering application type failed."
    exit 1
fi

