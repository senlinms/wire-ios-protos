#!/bin/bash

set -e

CARTHAGE=`Scripts/find-carthage.py`
BASE_FOLDER=`pwd`
echo "Found carthage folder in ${CARTHAGE}"
cd ${CARTHAGE}/Checkouts/generic-message-proto/ios/
cp ./../proto/messages.proto ./
mkdir -p ./tmp
cat ios.proto messages.proto > ./tmp/messages.proto
/usr/local/bin/protoc ./tmp/messages.proto --objc_out="${BASE_FOLDER}/Protos/" --plugin=/usr/local/bin/protoc-gen-objc
rm -rf ./tmp
rm messages.proto


cd ${CARTHAGE}/Checkouts/backend-api-protobuf/ios/
cp ./../proto/otr.proto ./
mkdir -p ./tmp
cat ios.proto otr.proto > ./tmp/otr.proto
/usr/local/bin/protoc ./tmp/otr.proto --objc_out="${BASE_FOLDER}/Protos/" --plugin=/usr/local/bin/protoc-gen-objc
rm -rf ./tmp
rm otr.proto

echo "✅ Done!"
