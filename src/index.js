import createExpressMiddleware from 'webpack-dev-middleware'

export default (compiler, options) => {
  const expressMiddleware = createExpressMiddleware(compiler, options)

  return function * devMiddleware (next) {
    const ctx = this

    const ended = yield done => {
      expressMiddleware(ctx.req, {
        end: content => {
          ctx.body = content

          done(null, true)
        },
        setHeader: ::ctx.set
      }, () => {
        done(null, false)
      })
    }

    if (!ended) {
      yield next
    }
  }
}
