require 'test_helper'

class ProcessQueueTest < ActiveSupport::TestCase
  test '::perform' do
    process_queue = mock
    process_queue.expects(:process!).once.returns(true)

    Repository.expects(:find).once.with(123).returns(stub)
    ProcessQueue.expects(:new).once.returns(process_queue)

    ProcessQueue.perform({ 'id' => 123 })
  end

  test '#process!' do
    process_queue = ProcessQueue.new(Repository.new)
    process_queue.expects(:with_video).once
    process_queue.process!
  end
end
