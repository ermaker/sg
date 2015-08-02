require 'sinatra/base'
require 'mongoid'

module Honeypot
  # The main app class
  class App < Sinatra::Base
    configure do
      Mongoid.load!(File.expand_path('../../config/mongoid.yml', __FILE__))
    end
  end
end
