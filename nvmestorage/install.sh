#!/usr/bin/env ash

if [ "${1}" = "late" ]; then
  echo "NVMeStorage: Installing daemon for nvmestorage"
  cp -vf /usr/bin/bc /tmpRoot/usr/bin/bc
  cp -vf /usr/sbin/nvmevolume.sh /tmpRoot/usr/sbin/nvmevolume.sh
  DEST="/tmpRoot/lib/systemd/system/nvmevolume.service"
  echo "[Unit]"                                    >${DEST}
  echo "Description=Enable M2 volume"             >>${DEST}
  echo "After=multi-user.target"                  >>${DEST}
  echo                                            >>${DEST}
  echo "[Service]"                                >>${DEST}
  echo "Type=oneshot"                             >>${DEST}
  echo "RemainAfterExit=true"                     >>${DEST}
  echo "ExecStart=/usr/sbin/nvmevolume.sh"        >>${DEST}
  echo                                            >>${DEST}
  echo "[Install]"                                >>${DEST}
  echo "WantedBy=multi-user.target"               >>${DEST}

  mkdir -vp /tmpRoot/lib/systemd/system/multi-user.target.wants
  ln -vsf /lib/systemd/system/nvmevolume.service /tmpRoot/lib/systemd/system/multi-user.target.wants/nvmevolume.service
fi
