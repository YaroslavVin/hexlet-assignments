# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    return [status, headers, body] unless status == 200

    hash_body = Digest::SHA256.hexdigest(body.first.to_s)
    body << hash_body
    [status, headers, body]
  end
end
