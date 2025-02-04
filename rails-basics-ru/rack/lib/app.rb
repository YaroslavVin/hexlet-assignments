# frozen_string_literal: true

require 'rack'
require 'rack/builder'
require_relative 'app/admin_policy'
require_relative 'app/signature'
require_relative 'app/router'

module App
  def self.init
    Rack::Builder.new do
      use AdminPolicy
      use Signature
      run Router.new
    end
  end
end
