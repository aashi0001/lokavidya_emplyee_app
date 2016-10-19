class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.integer :category_id
      t.string :subcategory_name
      t.boolean :is_active
      t.timestamps
    end
    #add_index :categories, :categories_id
  end
end
