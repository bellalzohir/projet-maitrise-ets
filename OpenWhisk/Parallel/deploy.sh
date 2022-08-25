#!/bin/bash

echo "uploading action package..."
wsk -i action update parallel-action parallel.js -a provide-api-key true