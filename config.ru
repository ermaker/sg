require 'bundler/setup'
Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

%w(app lib).each do |dir|
  path = File.expand_path("../#{dir}", __FILE__)
  $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
end

use Rack::Timeout
Rack::Timeout.timeout = 5

require 'app'

run Honeypot::App
