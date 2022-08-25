#!/bin/bash

wsk -i action update pi pi.js
wsk -i action update fibonacciIterative fibonacciIterative.js
wsk -i action update fibonacciRecursive fibonacciRecursive.js
wsk -i action update fibonacciArray fibonacciArray.js
wsk -i action update fibonacciMemo fibonacciMemo.js
