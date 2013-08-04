require 'typhoeus'
require 'zlib'
require 'json'
require 'stringio'
require_relative 'ten_stack/client'

module TenStack
  def self.configure(&block)
    client = TenStack::Client.new
    yield(client)

    client
  end
end
