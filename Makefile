MAKEFLAGS = -j1

PATH := ./node_modules/.bin:$(PATH)
SHELL := /bin/bash

.PHONY: clean build major minor patch publish test

clean:
	rm -rf ./lib/

build:
	make clean && webpack --progress

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
