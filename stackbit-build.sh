#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5f36d8d5fc6a6c001c0a4674/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5f36d8d5fc6a6c001c0a4674
curl -s -X POST https://api.stackbit.com/project/5f36d8d5fc6a6c001c0a4674/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5f36d8d5fc6a6c001c0a4674/webhook/build/publish > /dev/null
