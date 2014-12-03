class RemoveProcessLog < ActiveRecord::Migration
  def change
    reversible do |direction|
      direction.up do
        drop_table(:process_logs)
      end

      direction.down do
        raise ActiveRecord::IrreversibleMigration
      end
    end
  end
end
