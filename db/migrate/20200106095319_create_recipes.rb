class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :public_id, null: false
      t.string :dish_name, null: false
      t.string :comment
      t.string :recipe_image_id

      t.timestamps
    end
    add_index :recipes, :dish_name
  end
end
