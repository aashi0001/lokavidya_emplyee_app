class RemoveCategoryFromVideos < ActiveRecord::Migration[5.0]
  def change
    remove_column :videos, :category, :integer
  end
end
