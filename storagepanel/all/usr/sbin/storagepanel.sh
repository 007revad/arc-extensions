#!/usr/bin/env bash
#
# Copyright (C) 2023 AuxXxilium <https://github.com/AuxXxilium> and Ing <https://github.com/wjz304>
# 
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# $1 ?
#  RACK_0_Bay
#  RACK_2_Bay
#  RACK_4_Bay
#  RACK_8_Bay
#  RACK_10_Bay
#  RACK_12_Bay
#  RACK_12_Bay_2
#  RACK_16_Bay
#  RACK_20_Bay
#  RACK_24_Bay      # default
#  RACK_60_Bay
#  TOWER_1_Bay
#  TOWER_2_Bay
#  TOWER_4_Bay
#  TOWER_4_Bay_J
#  TOWER_4_Bay_S
#  TOWER_5_Bay
#  TOWER_6_Bay
#  TOWER_8_Bay
#  TOWER_12_Bay
# $2 ?
#  S2
#  M2X1              # default
#  LCM2

HDD_BAY="${1:-RACK_24_Bay}"
SSD_BAY="${2:-M2X1}"
FILE_JS="/usr/syno/synoman/webman/modules/StorageManager/storage_panel.js"
FILE_GZ="${FILE_JS}.gz"
_UNIQUE="$(/bin/get_key_value /etc.defaults/synoinfo.conf unique)"

[ ! -f "${FILE_GZ}.bak" ] && cp -f "${FILE_GZ}" "${FILE_GZ}.bak" && chmod a+r "${FILE_GZ}.bak"

rm -f "${FILE_JS}"
gzip -d "${FILE_GZ}"
sed -i "s/\"${_UNIQUE}\",//g; s/,\"${_UNIQUE}\"//g; s/${HDD_BAY}:\[\"/${HDD_BAY}:\[\"${_UNIQUE}\",\"/g; s/${SSD_BAY}:\[\"/${SSD_BAY}:\[\"${_UNIQUE}\",\"/g" "${FILE_JS}"
gzip -c "${FILE_JS}" > "${FILE_GZ}"
chmod a+r "${FILE_JS}" "${FILE_GZ}"

exit 0