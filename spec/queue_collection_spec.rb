require File.dirname(__FILE__) + "/spec_helper"

describe "queue collection" do
  it "should be able to put and get items" do
    queue = QueueCollection.new('./')
    queue.put('key', 'value')
    queue.take('key').should == 'value'
  end

  after(:all) do
    file = File.dirname(__FILE__) + '/../key'
    File.delete(file) if File.exist?(file)
  end
end
