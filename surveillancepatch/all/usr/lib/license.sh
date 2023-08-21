#!/bin/bash
while true
do
sleep 3600
/var/packages/SurveillanceStation/target/bin/ssctl stop
/var/packages/SurveillanceStation/target/bin/ssctl start

done
