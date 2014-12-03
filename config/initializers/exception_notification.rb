require 'exception_notification/rails'

require 'resque/failure/multiple'
require 'resque/failure/redis'
require 'exception_notification/resque'

Resque::Failure::Multiple.classes = [Resque::Failure::Redis, ExceptionNotification::Resque]
Resque::Failure.backend = Resque::Failure::Multiple

ExceptionNotification.configure do |config|
  config.add_notifier :email, {
    email_prefix: "[#{Rails.env}] ",
    sender_address: %{"notifier" <notifier@gource.tv>},
    exception_recipients: %w{gourcetv+exceptions@gmail.com}
  }
end

Gourcetv::Application.config.middleware.use(ExceptionNotification::Rack)
