# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    if status == 200
      hash_body = Digest::SHA256.hexdigest(body.first)
      body << hash_body
    end
    [status, headers, body]
  end
end
