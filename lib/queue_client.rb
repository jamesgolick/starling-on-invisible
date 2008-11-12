require 'rest_client'

class QueueClient
  class << self
    def put(key, value)
      RestClient.post("http://localhost:5432/queue_items", :key => key, :value => value)
    end
  end
end
