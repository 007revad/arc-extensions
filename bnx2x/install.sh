if [ "${1}" = "rd" ]; then
  echo "Installing module for Broadcom NetXtremeII 10Gb adapter"
  ${INSMOD} "/modules/bnx2x.ko" ${PARAMS}
fi
