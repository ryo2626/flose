class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
    	t.integer     :public_id
      t.integer     :recipe_id
      t.timestamps
    end
  end
end
