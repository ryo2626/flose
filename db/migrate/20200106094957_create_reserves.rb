class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.integer :commodity_id, null: false
      t.integer :public_id, null: false

      t.timestamps
    end
  end
end
