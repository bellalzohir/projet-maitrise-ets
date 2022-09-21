#!/bin/bash

cwd=$(dirname $0)

pushd "$cwd/faas-profiler" >/dev/null 2>&1
    ./deployFunctions.sh
popd >/dev/null 2>&1

pushd "$cwd/OpenWhisk/Testcase3-Long-function-chain" >/dev/null 2>&1
    pushd "Sequence-chained/action" >/dev/null 2>&1
        ./action_update.sh
    popd >/dev/null 2>&1
    pushd "Sequence-nested/action" >/dev/null 2>&1
        ./action_update.sh
    popd >/dev/null 2>&1
popd >/dev/null 2>&1

pushd "$cwd/OpenWhisk/Testcase4-Application-breakdown" >/dev/null 2>&1
    ./deploy.sh
popd >/dev/null 2>&1

NOCOLOR='\033[0m'
GREEN='\033[1;32m'
RED='\033[1;31m'

TEST_STATUS='PASS'

# check that all actions are created
if wsk -i action list -i | grep 'autocomplete/countries';
then echo -e ">> ${GREEN}autocomplete/countries successfully created${NOCOLOR}";
else echo -e ">> ${RED}autocomplete/countries not created${NOCOLOR}"; TEST_STATUS="FAIL";
fi
if wsk -i action list -i | grep "autocomplete/uspresidents";
then echo -e ">> ${GREEN}autocomplete/uspresidents successfully created${NOCOLOR}";
else echo -e ">> ${RED}autocomplete/uspresidents not created${NOCOLOR}"; TEST_STATUS="FAIL";
fi
if wsk -i action list -i | grep "img-resize";
then echo -e ">> ${GREEN}img-resize successfully created${NOCOLOR}";
else echo -e ">> ${RED}img-resize not created${NOCOLOR}"; TEST_STATUS="FAIL";
fi
if wsk -i action list -i | grep "markdown2html";
then echo -e ">> ${GREEN}markdown2html successfully created${NOCOLOR}";
else echo -e ">> ${RED}markdown2html not created${NOCOLOR}"; TEST_STATUS="FAIL";
fi
if wsk -i action list -i | grep "base64-nodejs";
then echo -e ">> ${GREEN}base64-nodejs successfully created${NOCOLOR}";
else echo -e ">> ${RED}base64-nodejs not created${NOCOLOR}"; TEST_STATUS="FAIL";
fi
if wsk -i action list -i | grep "base64-python";
then echo -e ">> ${GREEN}base64-python successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}base64-python not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "base64-ruby";
then echo -e ">> ${GREEN}base64-ruby successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}base64-ruby not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "base64-swift";
then echo -e ">> ${GREEN}base64-swift successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}base64-swift not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "http-endpoint-nodejs";
then echo -e ">> ${GREEN}http-endpoint-nodejs successfully created${NOCOLOR}";
else echo -e ">> ${RED}http-endpoint-nodejs not created${NOCOLOR}"; TEST_STATUS="FAIL";
fi
if wsk -i action list -i | grep "http-endpoint-python";
then echo -e ">> ${GREEN}http-endpoint-python successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}http-endpoint-python not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "http-endpoint-ruby";
then echo -e ">> ${GREEN}http-endpoint-ruby successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}http-endpoint-ruby not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "http-endpoint-swift";
then echo -e ">> ${GREEN}http-endpoint-swift successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}http-endpoint-swift not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "json-nodejs";
then echo -e ">> ${GREEN}json-nodejs successfully created${NOCOLOR}";
else echo -e ">> ${RED}json-nodejs not created${NOCOLOR}"; TEST_STATUS="FAIL";
fi
if wsk -i action list -i | grep "json-python";
then echo -e ">> ${GREEN}json-python successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}json-python not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "json-ruby";
then echo -e ">> ${GREEN}json-ruby successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}json-ruby not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "primes-nodejs";
then echo -e ">> ${GREEN}primes-nodejs successfully created${NOCOLOR}";
else echo -e ">> ${RED}primes-nodejs not created${NOCOLOR}"; TEST_STATUS="FAIL";
fi
if wsk -i action list -i | grep "primes-python";
then echo -e ">> ${GREEN}primes-python successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}primes-python not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "primes-ruby";
then echo -e ">> ${GREEN}primes-ruby successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}primes-ruby not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "primes-swift";
then echo -e ">> ${GREEN}primes-swift successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}primes-swift not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "ocr-img";
then echo -e ">> ${GREEN}ocr-img successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}ocr-img not created"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "sentiment";
then echo -e ">> ${GREEN}sentiment successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}sentiment not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "arraySum_chained";
then echo -e ">> ${GREEN}arraySum_chained successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}arraySum_chained not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "arraySum_sequence";
then echo -e ">> ${GREEN}arraySum_sequence successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}arraySum_sequence not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "arraySumNested";
then echo -e ">> ${GREEN}arraySumNested successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}arraySumNested not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "extractImageMetadataimageseq";
then echo -e ">> ${GREEN}extractImageMetadataimageseq successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}extractImageMetadataimageseq not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "transformMetadataimageseq";
then echo -e ">> ${GREEN}transformMetadataimageseq successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}transformMetadataimageseq not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "handlerimageseq";
then echo -e ">> ${GREEN}handlerimageseq successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}handlerimageseq not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "thumbnailimageseq";
then echo -e ">> ${GREEN}thumbnailimageseq successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}thumbnailimageseq not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "storeImageMetadataimageseq";
then echo -e ">> ${GREEN}storeImageMetadataimageseq successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}storeImageMetadataimageseq not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
if wsk -i action list -i | grep "imageProcessSequence";
then echo -e ">> ${GREEN}imageProcessSequence successfully created${NOCOLOR}"; 
else echo -e ">> ${RED}imageProcessSequence not created${NOCOLOR}"; TEST_STATUS="FAIL";  
fi
echo $TEST_STATUS