# frozen_string_literal: true

require 'rack'
require 'thin'
require 'json'

class Router
  def call(env)
    request = Rack::Request.new(env)

    case request.path
    when '/'
      [200, { 'Content-Type' => 'text/plain' }, ['Welcome to the app!']]
    when '/about'
      [200, { 'Content-Type' => 'text/plain' }, ['About page']]
    else
      [404, { 'Content-Type' => 'text/plain' }, ['Not Found']]
    end
  end
end
