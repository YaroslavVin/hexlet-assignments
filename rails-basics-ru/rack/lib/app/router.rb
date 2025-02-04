# frozen_string_literal: true

require 'rack'
require 'thin'
require 'json'
require 'digest'

class Router
  def call(env)
    request = Rack::Request.new(env)

    pp "[Router] request: #{Digest::SHA256.hexdigest('Hello, World!')}"

    case request.path
    when '/'
      [200, {}, ['Hello, World!']]
    when '/about'
      [200, {}, ['About page']]
    else
      [404, {}, ['404 Not Found']]
    end
  end
end
