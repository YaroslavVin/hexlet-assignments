# frozen_string_literal: true

require 'rack'
require 'webrick'
require_relative 'app/admin_policy'
require_relative 'app/execution_timer'
require_relative 'app/signature'
require_relative 'app/router'

module App
  def self.init
    Rack::Builder.new do |builder|
      builder.use AdminPolicy
      builder.use Signature
      builder.run Router.new
    end
  end

end

Rack::Handler::WEBrick.run(App.init, Port: 3000)
# Rack::Handler::WEBrick.run App, Port: 3000
# Rack::Handler::WEBrick.run MyApp.new, Port: 3000, Logger: WEBrick::Log.new(log_file)
