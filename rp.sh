#!/bin/bash
source ./config.cfg
curl -X DELETE http://$mountebank_server:2525/imposters/$1?removeProxies=true&replayable=true 
