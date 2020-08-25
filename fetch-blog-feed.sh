#!/bin/bash

# This script downloads the static JSON for the blog feed in order to improve SEO.

cd _data
wget -O blog-feed.json https://blog.bitcoinabc.org/json/

# HTML-escape unicode characters because Jekyll complains about them despite
# these characters being within strings.
sed -i 's/\\\(u[a-z0-9]\{4\}\)/\&#x\1;/g' blog-feed.json
