# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "[Signature] Adding signature for #{env['PATH_INFO']}"
    status, headers, body = @app.call(env)

    body << Digest::SHA256.hexdigest('asd')

    [status, headers, body]
  end
end
