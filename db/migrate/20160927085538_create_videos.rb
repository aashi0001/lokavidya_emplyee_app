class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :rating
      t.integer :category
      t.integer :subcategory
      t.string :language
      t.text :tags
      t.text :description
      t.integer :uid
      t.string :status
      t.integer :duration
      t.string :url_name
      t.string :tumbnail
      t.string :video

      t.timestamps
    end
  end
end
