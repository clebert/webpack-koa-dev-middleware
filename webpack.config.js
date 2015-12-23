const webpack = require('webpack')

const testMode = process.env.NODE_ENV === 'test'

module.exports = {
  bail: true,
  debug: true,
  devtool: '#inline-source-map',
  entry: [
    'source-map-support/register',
    testMode ? './test/index.js' : './src/index.js'
  ],
  externals: /^[a-zA-Z0-9]/,
  module: {
    loaders: [{
      loader: 'babel',
      test: /\.js$/
    }],
    preLoaders: [{
      loader: 'eslint',
      test: /\.js$/
    }]
  },
  output: {
    filename: testMode ? 'test.js' : 'index.js',
    libraryTarget: 'commonjs2',
    path: './lib/',
    pathinfo: true
  },
  plugins: [new webpack.NoErrorsPlugin()],
  target: 'node'
}
