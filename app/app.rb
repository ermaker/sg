require 'sinatra/base'
require 'tilt/haml'
require 'sinatra/jbuilder'
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

    ACTIONS = {
      '0' => { number: 0, action: 0 },
      '1' => { number: 1, action: 1 }
    }

    get '/:uid.json' do
      @action = ACTIONS[params[:uid]]
      jbuilder :action
    end
  end
end
