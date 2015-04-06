Yt.configure do |config|
  if Rails.env.development?
    config.log_level = :debug
  end

  config.client_id = ENV['YOUTUBE_CLIENT_ID']
  config.client_secret = ENV['YOUTUBE_CLIENT_SECRET']
end
