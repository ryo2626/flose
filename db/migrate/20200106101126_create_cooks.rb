class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.integer :recipe_id, null: false
      t.integer :process_count, null: false
      t.string :process_text, null: false

      t.timestamps
    end
  end
end
