class AddProcessLogTable < ActiveRecord::Migration
  def change
    create_table(:process_logs) do |table|
      table.text(:body, null: false)
      table.datetime(:started_at, null: false)
      table.timestamps
    end
  end
end
