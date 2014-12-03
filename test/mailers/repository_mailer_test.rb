require 'test_helper'

class RepositoryMailerTest < ActionMailer::TestCase
  test 'processing start email' do
    repository = Repository.new(account: SecureRandom.hex(8), name: SecureRandom.hex(8))

    email = RepositoryMailer.processing_start_email(repository)

    assert_match(%r(#{repository.account}/#{repository.name}), email.body.to_s)
  end
end
