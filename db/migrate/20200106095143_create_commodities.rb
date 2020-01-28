class CreateCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :commodities do |t|
      t.integer :company_id, null: false
      t.string :commodity_name, null: false
      t.string :comment
      t.string :commodity_image_id
      t.integer :regular_price, null: false
      t.integer :sale_price, null: false
      t.integer :quantity, null: false
      t.datetime :limit, null: false
      t.integer :commodity_category, null: false

      t.timestamps
    end
  end
end
