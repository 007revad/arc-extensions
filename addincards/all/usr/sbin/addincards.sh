#!/usr/bin/env bash
#
# Copyright (C) 2023 AuxXxilium <https://github.com/AuxXxilium> and Ing <https://github.com/wjz304>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.

model="$(cat /proc/sys/kernel/syno_hw_version)"

# adapter_cards.conf
FILE="/usr/syno/etc.defaults/adapter_cards.conf"
[ ! -f "${FILE}.bak" ] && cp -f "${FILE}" "${FILE}.bak"
rm -f ${FILE}
for N in `cat "${FILE}.bak" | grep '\['`; do
  echo "${N}" >> "${FILE}"
  echo "${model}=yes" >> "${FILE}"
done
chmod a+rx "${FILE}"
cp -f "${FILE}" "${FILE/\.defaults/}"

exit 0