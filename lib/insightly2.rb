require 'insightly2/version'

class Hash
  def deep_transform_keys(&block)
    result = {}
    each do |key, value|
      result[yield(key)] = value.is_a?(Hash) ? value.deep_transform_keys(&block) : value
    end
    result
  end
end

module Insightly2
  autoload :Client, 'insightly2/client'
  autoload :DSL, 'insightly2/dsl'
  autoload :Resources, 'insightly2/resources'
  autoload :Errors, 'insightly2/errors'
  autoload :Utils, 'insightly2/utils'

  class << self
    # @return [String]
    attr_accessor :api_key
    attr_accessor :logger
  end

  module_function

  # @return [Insightly2::Client]
  def client
    @client ||= Client.new(Insightly2.api_key)
  end
end
