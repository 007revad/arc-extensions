#!/usr/bin/env ash

if [ "${1}" = "late" ]; then
  echo "Installing daemon for Usbids"
  cp -vf /usr/bin/usbids.sh /tmpRoot/usr/bin/usbids.sh

  DEST="/tmpRoot/lib/systemd/system/usbids.service"
  echo "[Unit]"                                        >${DEST}
  echo "Description=update Add-in cards and usb.map"  >>${DEST}
  echo "After=multi-user.target"                      >>${DEST}
  echo                                                >>${DEST}
  echo "[Service]"                                    >>${DEST}
  echo "Type=oneshot"                                 >>${DEST}
  echo "RemainAfterExit=true"                         >>${DEST}
  echo "ExecStart=/usr/bin/usbids.sh"                 >>${DEST}
  echo                                                >>${DEST}
  echo "[Install]"                                    >>${DEST}
  echo "WantedBy=multi-user.target"                   >>${DEST}

  mkdir -vp /tmpRoot/lib/systemd/system/multi-user.target.wants
  ln -vsf /lib/systemd/system/usbids.service /tmpRoot/lib/systemd/system/multi-user.target.wants/usbids.service
fi
