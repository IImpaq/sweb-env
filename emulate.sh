#!/bin/zsh

mode=$1

cd /tmp/sweb/ || exit 1

if [[ -n "$mode" ]]; then
  if [[ "$mode" == "run" ]]; then
    qemu-system-x86_64 -m 8M -drive file=SWEB.qcow2,index=0,media=disk -debugcon stdio -no-reboot -cpu qemu64 | tee output.log
  elif [[ "$mode" == "debug" ]]; then
    echo "make sure to compile in debug mode before"
    qemu-system-x86_64 -m 8M -drive file=SWEB.qcow2,index=0,media=disk -debugcon stdio -no-reboot -s -S | tee output.log
  else
    echo "no valid mode passed (options: run/debug)"
  fi
else
  echo "no mode passed (valid options: run/debug)"
fi

