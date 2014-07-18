Gourcetv::Application.config.middleware.use(ExceptionNotification::Rack,
  :email => {
    :email_prefix => "[#{Rails.env}] ",
    :sender_address => %{"notifier" <notifier@gource.tv>},
    :exception_recipients => %w{gourcetv+exceptions@gmail.com}
  })
