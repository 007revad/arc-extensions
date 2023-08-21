#!/usr/bin/env ash

if [ "${1}" = "late" ]; then
  echo "Creating service to exec CPU Freq scaling"
  cp -vf /usr/sbin/scaler.sh /tmpRoot/usr/sbin/scaler.sh
  cp -vf /usr/sbin/unscaler.sh /tmpRoot/usr/sbin/unscaler.sh
  cp -vf /usr/sbin/rescaler.sh /tmpRoot/usr/sbin/rescaler.sh
  DEST="/tmpRoot/lib/systemd/system/cpufreqscaling.service"
  echo "[Unit]"                                                                >${DEST}
  echo "Description=Enable CPU Freq scaling"                                  >>${DEST}
  echo                                                                        >>${DEST}
  echo "[Service]"                                                            >>${DEST}
  echo "User=root"                                                            >>${DEST}
  echo "Restart=on-abnormal"                                                  >>${DEST}
  echo "Environment=lowload=150"                                              >>${DEST}
  echo "Environment=midload=250"                                              >>${DEST}
  echo "ExecStart=/usr/sbin/cpufreqscaling.sh"                                >>${DEST}
  echo                                                                        >>${DEST}
  echo "[Install]"                                                            >>${DEST}
  echo "WantedBy=multi-user.target"                                           >>${DEST}

  mkdir -vp /tmpRoot/lib/systemd/system/multi-user.target.wants
  ln -vsf /lib/systemd/system/cpufreqscaling.service /tmpRoot/lib/systemd/system/multi-user.target.wants/cpufreqscaling.service
fi