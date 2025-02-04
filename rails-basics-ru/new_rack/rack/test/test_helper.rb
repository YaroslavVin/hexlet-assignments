# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'bundler/setup'
Bundler.require

require 'minitest'
require 'minitest/autorun'
require 'minitest/power_assert'
require 'rack/test'
require 'app'
