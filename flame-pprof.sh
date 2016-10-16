#!/bin/bash

# Install:
#   hey (http tester):  go get -u -v github.com/rakyll/hey
#
#   go get -u -v github.com/uber/go-torch
#
#   git clone https://github.com/brendangregg/FlameGraph.git
#   Flamegraph has to be in $PATH
#
# ./flame-pprof.sh [url_to_test] [url_pprof]
#
# ./flame-pprof.sh http://127.0.0.1:6060/yandry http://127.0.0.1:6060

hey -n 9000 -c 1000 $1 &

go-torch -t 5 -u $2
