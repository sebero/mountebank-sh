#!/bin/bash
docker run -p 2525:2525 -p 9000:10000 -d expert360/mountebank > .pid
