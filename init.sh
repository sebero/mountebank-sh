#!/bin/bash
docker run -p 2525:2525 -p 8001:8001 -p 8090:8090 -d expert360/mountebank > .pid
