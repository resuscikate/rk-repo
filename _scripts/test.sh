#!/bin/bash
set -x

timeout 30s bundle exec htmlproofer _site --only-4xx --disable-external --check-html --check-favicon
