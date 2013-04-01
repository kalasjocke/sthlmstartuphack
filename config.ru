require 'bundler'
Bundler.require

require './app'

use Rack::Deflater

if ENV["RACK_ENV"] == "development"
  require 'rack-livereload'
  use Rack::LiveReload
end

run App
