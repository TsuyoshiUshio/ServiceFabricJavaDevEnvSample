#!/bin/bash
set -x
azure servicefabric application package copy SfTestApplication fabric:ImageStore > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Application copy failed."
    exit 1
fi
azure servicefabric application type register SfTestApplication > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Application type registration failed."
    exit 1
fi
version=`grep "ApplicationTypeVersion" SfTestApplication/ApplicationManifest.xml | cut -d'=' -f2 | sed -e 's/^"//'  -e 's/"$//'`
eval azure servicefabric application upgrade start --application-name fabric:/SfTestApplication --target-application-type-version ${version} --rolling-upgrade-mode Monitored > /dev/null 2>&1
