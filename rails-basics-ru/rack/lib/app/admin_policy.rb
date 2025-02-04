# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    return [403, { 'Content-Type' => 'text/plain' }, ['Forbidden']] if request.path.include?('/admin')

    @app.call(env)
  end
end
