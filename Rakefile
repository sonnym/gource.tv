unless ENV['QUEUE']
  require File.expand_path('../config/application', __FILE__)
  Gourcetv::Application.load_tasks
end

require 'resque/tasks'
