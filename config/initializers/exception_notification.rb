require 'exception_notification/rails'

require 'resque/failure/multiple'
require 'resque/failure/redis'

require 'exception_notification/resque'

Resque::Failure::Multiple.classes = [Resque::Failure::Redis, ExceptionNotification::Resque]
Resque::Failure.backend = Resque::Failure::Multiple

Gourcetv::Application.config.middleware.use(ExceptionNotification::Rack,
  email: {
    email_prefix: "[#{Rails.env}] ",
    sender_address: %{"notifier" <notifier@gource.tv>},
    exception_recipients: %w{gourcetv+exceptions@gmail.com}
 })
