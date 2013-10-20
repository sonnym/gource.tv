class SetRepositoryProcessingStatusToFalse < ActiveRecord::Migration
  def change
    execute("UPDATE repositories SET processing = 0")
  end
end
