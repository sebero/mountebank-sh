#!/bin/bash
source ./config.cfg
curl -H 'Content-Type: application/json' http://$mountebank_server:2525/imposters 
