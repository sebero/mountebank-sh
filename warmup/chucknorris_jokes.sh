#!/bin/bash
source config.cfg
curl -i -X POST -H 'Content-Type: application/json' http://$mountebank_server:2525/imposters --data '{
  "port": 8001,
  "protocol": "http",
  "name": "chucknorris",
  "stubs": [
    {
      "responses": [
        {
          "proxy": {
            "to": "https://api.chucknorris.io",
            "mode": "proxyAlways",
            "predicateGenerators": [
              {
                "matches": {
                  "method": true,
                  "path": true,
                  "query": true
                }
              }
            ]
          }
        }
      ]
    }
  ]
}'

