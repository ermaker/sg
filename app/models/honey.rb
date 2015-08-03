require 'mongoid'

module SG
  # The Container for anything
  class Honey
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
  end
end
