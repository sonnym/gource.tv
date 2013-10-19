class AddRepositories < ActiveRecord::Migration
  def change
    create_table(:repositories) do |table|
      table.string(:account, :null => false)
      table.string(:name, :null => false)
  
      table.timestamps
    end
  end
end
