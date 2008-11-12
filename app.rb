require 'queue_collection'
require 'activesupport'

class ::QueueApp
  class << self
    def queue
      @queue ||= QueueCollection.new('./')
    end
  end
end

post '/queue_items' do
  QueueApp.queue.put(params[:key], params[:value])
end

post '/queue_items/first' do
  render QueueApp.queue.take(params[:key]).to_json
end
