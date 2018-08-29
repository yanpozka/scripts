#!/bin/bash

# -lm : math library
# -installsuffix cgo

# more info go build --help

CGO_ENABLED=0 go build -v -a -tags netgo -ldflags '-extldflags "-lm -lstdc++ -static"'
