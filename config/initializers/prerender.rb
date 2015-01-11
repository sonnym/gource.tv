if Rails.env.production?
  require 'redis'
  @redis = Redis.new

  Rails.application.config.middleware.use(Rack::Prerender,
    before_render: -> (env) { @redis.get(Rack::Request.new(env).url) },
    after_render: -> (env, response) { @redis.set(Rack::Request.new(env).url, response.body) }
  )
end
