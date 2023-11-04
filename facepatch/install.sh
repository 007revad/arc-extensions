#!/usr/bin/env ash

if [ "${1}" = "late" ]; then
  echo "Creating service to exec Facepatch"
  cp -vf /usr/sbin/facepatch.sh /tmpRoot/usr/sbin/facepatch.sh
  cp -vf /usr/sbin/PatchELFSharp /tmpRoot/usr/sbin/PatchELFSharp
  DEST="/tmpRoot/lib/systemd/system/facepatch.service"
  echo "[Unit]"                                                                >${DEST}
  echo "Description=Enable Facepatch"                                         >>${DEST}
  echo                                                                        >>${DEST}
  echo "[Service]"                                                            >>${DEST}
  echo "Type=oneshot"                                                         >>${DEST}
  echo "RemainAfterExit=true"                                                 >>${DEST}
  echo "ExecStart=/usr/sbin/facepatch.sh"                                     >>${DEST}
  echo                                                                        >>${DEST}
  echo "[Install]"                                                            >>${DEST}
  echo "WantedBy=multi-user.target"                                           >>${DEST}

  mkdir -vp /tmpRoot/lib/systemd/system/multi-user.target.wants
  ln -vsf /lib/systemd/system/facepatch.service /tmpRoot/lib/systemd/system/multi-user.target.wants/facepatch.service
fi