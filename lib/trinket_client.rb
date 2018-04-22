require 'singleton'
require 'trinket_services_pb'

class Trinket::Client
  include Singleton

  def initialize
    @channel = Trinket::Gem::Stub.new 'localhost:50051', :this_channel_is_insecure
  end

  def gem name:
    @channel.gem Trinket::Request.new name: name
  end
end
