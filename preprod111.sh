curl -i -X POST -H 'Content-Type: application/json' http://127.0.0.1:2525/imposters --data '{
  "port": 8881,
  "protocol": "http",
  "name": "preprod111",
  "stubs": [
    {
      "responses": [
        {
          "proxy": {
            "to": "http://accommodation.preprod111.atrpm.com",
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