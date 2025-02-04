# frozen_string_literal: true

require 'rack'
require 'rack/builder'
require_relative 'lib/app'

run App.init