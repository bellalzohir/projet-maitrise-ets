#!/bin/bash

cwd=$(dirname $0)
BLUE='\033[1;34m'
NOCOLOR='\033[0m'
pushd "$cwd/functions/autocomplete" >/dev/null 2>&1
    npm install
    npm link
    echo -e "\n${BLUE}creating autocomplete countries function"
    acsetup data/countries.txt >/dev/null 2>&1
    echo -e "\ncreating autocomplete uspresidents function${NOCOLOR}\n"
    acsetup data/uspresidents.txt >/dev/null 2>&1
    #test curl 'https://localhost:31001/api/v1/web/guest/autocomplete/countries?term=a'
popd >/dev/null 2>&1

pushd "$cwd/functions/img-resize" >/dev/null 2>&1
    npm install node-zip jimp --save
    if [ ! -e action.zip ]; then
        echo "action.zip not found, creating..."
        zip -r action.zip ./* >/dev/null 2>&1
    fi
    echo -e "\n${BLUE}creating img-resize function${NOCOLOR}"
    wsk action update img-resize --kind nodejs:14 action.zip --web raw -i
    #wsk action get img-resize --url -i
    #curl -X POST -H "Content-Type: image/jpeg" --data-binary @./libertybell.jpg https://localhost:31001/api/v1/web/guest/default/img-resize -k -v >output.zip
popd >/dev/null 2>&1

pushd "$cwd/functions/markdown-to-html" >/dev/null 2>&1
    wsk action update markdown2html markdown2html.py --docker immortalfaas/markdown-to-html --web raw -i
    #wsk action invoke markdown2html -i -P openpiton-readme.json -r -v
popd >/dev/null 2>&1

pushd "$cwd/functions/microbenchmarks" >/dev/null 2>&1
    pushd ./base64 >/dev/null 2>&1
        wsk -i action update base64-nodejs base64-node.js
        wsk -i action update base64-python base64-python.py
        wsk -i action update base64-ruby base64-ruby.rb
        wsk -i action update base64-swift base64-swift.swift
    popd >/dev/null 2>&1
    pushd ./http-endpoint >/dev/null 2>&1
        wsk -i action update http-endpoint-nodejs http-endpoint-node.js
        wsk -i action update http-endpoint-python http-endpoint-python.py
        wsk -i action update http-endpoint-ruby http-endpoint-ruby.rb
        wsk -i action update http-endpoint-swift http-endpoint-swift.swift
    popd >/dev/null 2>&1
    pushd ./json >/dev/null 2>&1
        wsk -i action update json-nodejs json-node.js
        wsk -i action update json-python json-python.py
        wsk -i action update json-ruby json-ruby.rb
        #wsk action invoke json-python -i -r -P ./1.json
        #ruby generate_json.rb
    popd >/dev/null 2>&1
    pushd ./primes >/dev/null 2>&1
        wsk -i action update primes-nodejs primes-node.js
        wsk -i action update primes-python primes-python.py
        wsk -i action update primes-ruby primes-ruby.rb
        wsk -i action update primes-swift primes-swift.swift
    popd >/dev/null 2>&1
popd >/dev/null 2>&1

pushd "$cwd/functions/ocr-img" >/dev/null 2>&1
    wsk action update ocr-img handler.js --docker immortalfaas/nodejs-tesseract --web raw -i
    #wsk action get ocr-img --url -i
    #curl -X POST -H "Content-Type: image/jpeg" --data-binary @./pitontable.jpg https://localhost:31001/api/v1/web/guest/default/ocr-img -k -v >output.txt
popd >/dev/null 2>&1

pushd "$cwd/functions/sentiment-analysis" >/dev/null 2>&1
    wsk action update sentiment sentiment.py --docker immortalfaas/sentiment --web raw -i
    #wsk action invoke sentiment -i -p "analyse" "delightful" -r
    #wsk action invoke sentiment -i -P declaration.json -r
popd >/dev/null 2>&1
