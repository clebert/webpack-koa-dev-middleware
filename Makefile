MAKEFLAGS = -j1

PATH := ./node_modules/.bin:$(PATH)
SHELL := /bin/bash

.PHONY: build clean major minor patch publish test

build:
	make clean && webpack --progress

clean:
	rm -rf ./lib/

major:
	npm version major && make publish

minor:
	npm version minor && make publish

patch:
	npm version patch && make publish

publish:
	make test && make build && publish-please && git push && git push --tags

test:
	[ -f ./test/index.js ] && export NODE_ENV=test && make build && node ./lib/test.js || echo 'no tests found'
