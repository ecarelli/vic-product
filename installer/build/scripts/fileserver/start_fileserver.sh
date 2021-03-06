#!/usr/bin/bash
# Copyright 2017 VMware, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -euf -o pipefail

data_dir=/opt/vmware/fileserver
cert_dir=${data_dir}/cert
cert=${cert_dir}/server.crt
key=${cert_dir}/server.key

FILESERVER_EXPOSED_PORT=$(ovfenv -k fileserver.port)

if [ -z "$FILESERVER_EXPOSED_PORT" ]; then
  FILESERVER_EXPOSED_PORT="9443"
fi

# Start file server with certificate cause we'll generate self-signed certificates if it's not customized by user
/usr/local/bin/ova-webserver --addr ":${FILESERVER_EXPOSED_PORT}" --cert "${cert}" --key "${key}"

