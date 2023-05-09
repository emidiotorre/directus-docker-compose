#!/bin/bash
rootPath=$1
nginxVersion=1.23-alpine  # Could also be passed as an argument using $2

result=$(docker run --rm -t -a stdout --name my-nginx \
-v $(pwd)/nginx/conf.d:/etc/nginx/conf.d:ro \
-v $(pwd)/certbot/www:/var/www/certbot \
-v $(pwd)/certbot/conf:/etc/letsencrypt \
nginx:$nginxVersion nginx -c /etc/nginx/nginx.conf -t)

# Look for the word successful and count the lines that have it
# This validation could be improved if needed
successful=$(echo $result | grep successful | wc -l)

if [ $successful = 0 ]; then
    echo NGINX TEST FAILED
    echo "$result"
    exit 1
else
    echo NGINX TEST SUCCESSFUL
fi
