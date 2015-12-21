MAKEFLAGS = -j1

export DIRNAME := $(strip $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST)))))
export PATH := $(DIRNAME)/node_modules/.bin:$(PATH)
export SHELL := /bin/bash

.PHONY: build clean

build: clean
	webpack --bail --progress $(DIRNAME)/src/index.js $(DIRNAME)/lib/index.js

clean:
	rm -rf $(DIRNAME)/packages/*/lib/
	rm -rf $(DIRNAME)/packages/*/npm-debug*
