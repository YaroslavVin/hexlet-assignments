# frozen_string_literal: true

require 'digest'

class Signature
  def call(env)
    puts "[Signature] Adding signature for #{env['PATH_INFO']}"

    request = Rack::Request.new(env)

    result_hash = Digest::SHA256.digest(request[1])

    return [request[0], headers[1], body[2]] if status != 200

    body.push(result_hash)
    [status, headers, body]
  end
end
