#!/bin/bash

envsubst < /etc/envoy/envoy-config-template.yaml > /configs/envoy-config.yaml

exec envoy -c /configs/envoy-config.yaml "$@"