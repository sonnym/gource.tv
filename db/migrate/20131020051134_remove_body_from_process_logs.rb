class RemoveBodyFromProcessLogs < ActiveRecord::Migration
  def change
    remove_column(:process_logs, :body)
  end
end
