#!/bin/bash
go build -tags netgo -ldflags '-extldflags "-lm -lstdc++ -static"'
