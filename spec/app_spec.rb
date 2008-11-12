require File.dirname(__FILE__) + "/spec_helper"

describe "queue app" do
  describe "on POST to /queue_items" do
    it "should push an item on to the queue" do
      QueueCollection.should_receive(:put).with('mykey', 'myvalue')
      post('/queue_items?key=mykey&value=myvalue')
    end
  end
end
