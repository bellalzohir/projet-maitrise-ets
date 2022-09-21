#
# Copyright (c) 2020 Institution of Parallel and Distributed System, Shanghai Jiao Tong University
# ServerlessBench is licensed under the Mulan PSL v1.
# You can use this software according to the terms and conditions of the Mulan PSL v1.
# You may obtain a copy of Mulan PSL v1 at:
#     http://license.coscl.org.cn/MulanPSL
# THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT, MERCHANTABILITY OR FIT FOR A PARTICULAR
# PURPOSE.
# See the Mulan PSL v1 for more details.
#
if [ -z "$TESTCASE4_HOME" ]; then
    echo "$0: ERROR: TESTCASE4_HOME environment variable not set"
    exit
fi

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $SRC_DIR > /dev/null 2>&1
wsk action update extractImageMetadataimageseq extract-image-metadata/target/extract-image-metadata.jar --main org.serverlessbench.ExtractImageMetadata --kind java:8-imagemagick -i
wsk action update transformMetadataimageseq transform-metadata/target/transform-metadata.jar --main org.serverlessbench.TransformMetadata --kind java:8 -i
wsk action update handlerimageSeq handler/target/handler.jar --main org.serverlessbench.Handler --kind java:8 -i
wsk action update thumbnailimageseq thumbnail/target/thumbnail.jar --main org.serverlessbench.Thumbnail -kind java:8-imagemagick -i
wsk action update storeImageMetadataimageseq  store-image-metadata/target/store-image-metadata.jar --main org.serverlessbench.StoreImageMetadata --kind java:8 -i
popd >/dev/null 2>&1

wsk action update imageProcessSequence --sequence extractImageMetadataimageseq,transformMetadataimageseq,handlerimageSeq,thumbnailimageseq,storeImageMetadataimageseq -i

