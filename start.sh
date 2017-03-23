#!/bin/bash
source ./config.cfg
curl -X POST http://$mountebank_server:2525/imposters/ -d @./dumps/$1.json
