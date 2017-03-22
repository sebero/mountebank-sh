# mountebank-sh
Mountebank shell client

Used to mock test tool witch connects to two different environments. Using Mountebank proxy server, we've executed one time our application and repeated 'til inifite.

## Start using:

``` 
 ./init.sh
```

Runs [expert360/mountebank](https://hub.docker.com/r/expert360/mountebank/) docker image exposing two ports: 8881 and 8883 to localhost

This two ports are proxied to the real end point (https://preprod111 and https://preprod113) where our application lives:


```
curl -i -X POST -H 'Content-Type: application/json' http://127.0.0.1:2525/imposters --data '{
  "port": 8881,
  "protocol": "http",
  "name": "preprod_environment_8881",
  "stubs": [
    {
      "responses": [
        {
          "proxy": {
            "to": "https://preprod111",
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

curl -i -X POST -H 'Content-Type: application/json' http://127.0.0.1:2525/imposters --data '{
  "port": 8883,
  "protocol": "http",
  "name": "preprod_environment_8883",
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

```

Once the system is warmed up... the next useful think to do is run your application pointing to your mountebank local instance.

```
http://localhost:8881/
or
http://localhost:8883/

```

## Backup your browsing history:

rp.sh dumps your port/service history to the screen. Pipe to a file to save for later use.

Dumped file, is a ready to use json config file for mountebank mock service. Without proxy related information.

```
./rp.sh 8883 > ./dumps/8883.json

```

## Load your config from file:

Reads information from previously save configuration at ./dumps folder


```

./start.sh 8881

```

## List services availables:

Gets all available services from Mountebank server

```

list.sh 

```

