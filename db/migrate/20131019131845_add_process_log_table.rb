class AddProcessLogTable < ActiveRecord::Migration
  def change
    create_table(:process_logs) do |table|
      table.integer(:repository_id, null: false)

      table.text(:body, null: false)
      table.datetime(:started_at, null: false)

      table.timestamps
    end

    add_foreign_key(:process_logs, :repositories)
  end
end
