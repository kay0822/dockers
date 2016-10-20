#!/bin/bash

service mongodb start 
RET=1
while [ $RET -ne 0 ]; do 
	echo "=> Waiting for confirmation of MongoDB service startup"
	sleep 3 
	mongo admin --eval "help" >/dev/null 2>&1; 
	RET=$?	
done	
mongorestore -h 127.0.0.1 -d leanote --directoryperdb /leanote/mongodb_backup/leanote_install_data/		
cd /leanote/bin
bash /leanote/bin/run.sh || bash /leanote/bin/run.sh
