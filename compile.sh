#!/bin/zsh

mode=$1

cd /tmp/sweb/ || exit 1

if [[ -n "$mode" ]]; then
  if [[ "$mode" == "release" ]]; then
    docker exec -it --workdir /tmp os-ubuntu bash -c "cd sweb/ && cmake -DARCH=x86/64 -GNinja ../src/ && ninja"
  elif [[ "$mode" == "debug" ]]; then
    docker exec -it --workdir /tmp os-ubuntu bash -c "cd sweb/ && cmake -DDEBUG=1 -DARCH=x86/64 -GNinja ../src/ && ninja"
  else
    echo "no valid mode passed (options: release/debug)"
  fi
else
  echo "no mode passed (valid options: release/debug)"
fi
