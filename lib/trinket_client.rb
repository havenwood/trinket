# frozen_string_literal: true

require 'singleton'
require 'trinket_services_pb'

module Trinket
  class Client
    include Singleton

    def initialize
      @channel = Trinket::Gems::Stub.new 'localhost:50051', :this_channel_is_insecure
    end

    def gem(name:)
      @channel.gem Trinket::Request.new name: name
    end
  end
end
