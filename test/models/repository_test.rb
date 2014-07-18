require 'test_helper'

class RepostioryTest < ActiveSupport::TestCase
  test 'enqueues job after creation' do
    repository = Repository.new(account: :foo, name: :bar)
    repository.expects(:process_video).once

    repository.save
  end
end
