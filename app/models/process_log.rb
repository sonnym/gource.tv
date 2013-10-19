class ProcessLog < ActiveRecord::Base
  belongs_to(:repository)
end
