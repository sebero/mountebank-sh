curl -i -X POST -H 'Content-Type: application/json' http://127.0.0.1:2525/imposters --data '{
  "port": 8883,
  "protocol": "http",
  "name": "preprod113",
  "stubs": [
    {
      "responses": [
        {
          "proxy": {
            "to": "https://preprod113",
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
