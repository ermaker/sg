require 'sinatra/base'
require 'tilt/haml'
require 'mongoid'
require 'models/honey'

module SG
  # The main app class
  class App < Sinatra::Base
    configure do
      Mongoid.load!(File.expand_path('../../config/mongoid.yml', __FILE__))
    end

    get '/' do
      haml :index
    end

    post '/' do
      request.body.rewind
      honey_raw = request.body.read
      Honey.create(JSON.parse(honey_raw)) unless honey_raw.empty?
    end
  end
end
