# webpack-koa-dev-middleware

[![Build Status](https://travis-ci.org/clebert/webpack-koa-dev-middleware.svg?branch=master)](https://travis-ci.org/clebert/webpack-koa-dev-middleware)
[![NPM Version](https://badge.fury.io/js/webpack-koa-dev-middleware.svg)](https://badge.fury.io/js/webpack-koa-dev-middleware)

> A [Koa](http://koajs.com/) wrapper for [webpack-dev-middleware](https://github.com/webpack/webpack-dev-middleware)

[![js-standard-style](https://cdn.rawgit.com/feross/standard/master/badge.svg)](https://github.com/feross/standard)

## Installation

```sh
npm install webpack-koa-dev-middleware
```

## Usage

For more information, see [here](https://github.com/webpack/webpack-dev-middleware/blob/master/README.md).

### Koa 1.x

```js
const createDevMiddleware = require('webpack-koa-dev-middleware')

// ...

app.use(createDevMiddleware(compiler, {
  noInfo: true,
  publicPath: '/'
}))
```

### Koa 2.x

```js
const convert = require('koa-convert')
const createDevMiddleware = require('webpack-koa-dev-middleware')

// ...

app.use(convert(createDevMiddleware(compiler, {
  noInfo: true,
  publicPath: '/'
})))
```
