MAKEFLAGS = -j1

PATH := ./node_modules/.bin:$(PATH)
SHELL := /bin/bash

.PHONY: clean build major minor patch publish test

clean:
	rm -rf ./lib/

build:
	webpack --progress

major:
	npm version major && make publish

minor:
	npm version minor && make publish

patch:
	npm version patch && make publish

publish:
	make clean && make build && make test && publish-please && git push && git push --tags

test:
	if [ -f ./test/index.js ] ; then \
		export NODE_ENV=test && make build && node ./lib/test.js ; \
	else \
		make build ; \
	fi
