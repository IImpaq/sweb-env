#!/bin/zsh

docker exec -it --workdir /tmp os-ubuntu bash -c "cd sweb/ && cmake -GNinja ../src/ && ninja"
