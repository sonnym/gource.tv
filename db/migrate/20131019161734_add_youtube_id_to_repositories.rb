class AddYoutubeIdToRepositories < ActiveRecord::Migration
  def change
    add_column(:repositories, :youtube_id, :string, default: nil)
  end
end
