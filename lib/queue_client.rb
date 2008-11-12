require 'rubygems'
require 'activesupport'
require 'rest_client'


class QueueClient
  class << self
    def put(key, value)
      RestClient.post("http://localhost:5432/queue_items", :key => key, :value => value)
    end

    def take(key)
      YAML.load RestClient.post("http://localhost:5432/queue_items/first", :key => key)
    end
  end
end
