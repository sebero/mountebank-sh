#!/bin/bash
source ./config.cfg
curl -X GET "http://$mountebank_server:2525/imposters/$1"
