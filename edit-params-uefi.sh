#!/bin/bash

set -euxo pipefail

PARAM_FILE="$1"
BM_WORKER_MODEL="$2"

sed -i '/^provisioning_net/ d' "${PARAM_FILE}"
sed -i '/^provisioning_mac_prefix/ d' "${PARAM_FILE}"
sed -i "11 a provisioning_enable: false" "${PARAM_FILE}"
sed -i "12 a virtual_protocol: redfish" "${PARAM_FILE}"
sed -i "s/ipmi_address/redfish_address/g" "${PARAM_FILE}"
sed -i "/^- redfish_address/ a\ \ model: ${BM_WORKER_MODEL}" "${PARAM_FILE}"

