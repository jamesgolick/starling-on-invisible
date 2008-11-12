require File.dirname(__FILE__) + "/spec_helper"

describe "queue app" do
  describe "on POST to /queue_items" do
    it "should push an item on to the queue" do
      QueueCollection.should_receive(:put).with('mykey', 'myvalue')
      post('/queue_items?key=mykey&value=myvalue')
    end
  end

  describe "on POST to /queue_items/first" do
    it "should return the first item from the queue" do
      QueueCollection.stub!(:take).with('mykey').and_return('somethingawesome')
      post('/queue_items/first?key=mykey').body.should == 'somethingawesome'.to_json
    end
  end
end
