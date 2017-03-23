#!/bin/bash
source ./config.cfg
curl -X GET http://$mountebank_server/imposters/$1
