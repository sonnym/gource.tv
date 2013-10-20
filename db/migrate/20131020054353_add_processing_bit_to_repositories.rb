class AddProcessingBitToRepositories < ActiveRecord::Migration
  def change
    add_column(:repositories, :processing, :boolean, null: false, default: true)
  end
end
