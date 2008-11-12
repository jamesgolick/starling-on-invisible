require 'activesupport'

post '/queue_items' do
  QueueCollection.put(params[:key], params[:value])
end

post '/queue_items/first' do
  render QueueCollection.take(params[:key]).to_json
end
