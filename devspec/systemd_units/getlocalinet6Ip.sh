#!/bin/sh
##########################################################################
# If not stated otherwise in this file or this component's Licenses.txt
# file the following copyright and licenses apply:
#
# Copyright 2018 RDK Management
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################
. /etc/device.properties
sleep 5

ifconfig $ESTB_INTERFACE | grep Scope:Link >> /dev/null
if [ $? -ne 0 ] ; then
  mocaAddress=`cat /sys/class/net/"$ESTB_INTERFACE"/address`
  linkLocalIpv6Addr=`ipv6calc --in prefix+mac --action prefixmac2ipv6 fe80::/64 "$mocaAddress" --out ipv6addr`
  ip -f inet6 address add local "$linkLocalIpv6Addr" dev $ESTB_INTERFACE
else
  echo Link already present
fi

