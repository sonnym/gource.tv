class ProcessLog < ActiveRecord::Base
  belongs_to(:repository)

  %i(started_at created_at updated_at).each do |attr|
    define_method(attr) do
      read_attribute(attr).to_s('%F %T')
    end
  end

  def duration
    read_attribute(:created_at).to_time - read_attribute(:started_at).to_time
  end

  def as_json(opts = {})
    super(opts.merge(methods: %i(duration)))
  end
end
