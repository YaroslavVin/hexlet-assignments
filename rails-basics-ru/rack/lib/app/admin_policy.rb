# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "[AdminPolicy] #{env}"
    request = Rack::Request.new(env)

    return [403, { 'Content-Type' => 'text/plain' }, ['Forbidden']] if request.path == '/admin'

    puts "[AdminPolicy] not value for value #{env['PATH_INFO']}"
    @app.call(env)
  end
end
