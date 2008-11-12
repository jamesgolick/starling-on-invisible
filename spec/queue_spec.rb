require File.dirname(__FILE__) + '/spec_helper'
require 'queue_client'

describe QueueClient do
  describe "put" do
    it "should post to /queue_items with the key and value" do
      RestClient.should_receive(:post).with('http://localhost:5432/queue_items', :key => 'somekey', :value => 'agreatvalue')
      QueueClient.put('somekey', 'agreatvalue')
    end
  end

  describe "take" do
    it "should post to /queue_items/first with the key" do
      RestClient.should_receive(:post).with("http://localhost:5432/queue_items/first", :key => 'somekey').and_return('whatever').to_yaml
      QueueClient.take('somekey').should == 'whatever'
    end
  end
end
