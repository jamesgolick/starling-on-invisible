post '/queue_items' do
  QueueCollection.put(params[:key], params[:value])
end
