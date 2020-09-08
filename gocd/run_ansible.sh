#!/bin/sh
echo $VAULTPASS > .vaultpass

set -ex
docker run --rm -v $AGENT_DATA_DIR/$GO_PIPELINE_NAME/deploy:/infra \
  -w /infra $ANSIBLE_IMG sh -c "set -x; $@"
