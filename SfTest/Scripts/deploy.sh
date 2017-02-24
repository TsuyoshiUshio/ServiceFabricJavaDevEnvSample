#!/bin/bash
set -x
appplicationCount=`azure servicefabric application show "fabric:/SfTestApplication" | grep fabric:/SfTestApplication | wc -l`
if [[ "$appplicationCount" -eq "0" ]];then
    echo "Deploying Application"
    /bin/bash Scripts/install.sh
else    
    echo "CleanUp: Undeploying existing app"
    /bin/bash uninstall.sh
    echo "Redeploying"
    /bin/bash Scripts/install.sh
fi
