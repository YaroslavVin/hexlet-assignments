# frozen_string_literal: true

class AdminPolicy
  def call(env)
    puts "[AdminPolicy] Checking admin access for #{env['PATH_INFO']}"
    request = Rack::Request.new(env)
    puts "[AdminPolicy] it is the path #{request.path}"

    [403, 'Forbidden'] if request.path == '/admin'
    puts "[AdminPolicy] not value for value #{env['PATH_INFO']}"
  end
end
