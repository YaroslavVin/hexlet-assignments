# frozen_string_literal: true

require 'rack'
require 'thin'

class MyApp
  def call(_env)
    [200, { 'Content-Type' => 'text/html' }, ['Hello']]
  end
end

Rack::Handler::Thin.run MyApp.new, Port: 3000
# ruby app.rb
