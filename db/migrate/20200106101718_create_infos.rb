class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.integer :user_status, null: false
      t.integer :public_id
      t.integer :company_id
      t.string :contributor, null: false
      t.string :contributor_email, null: false
      t.text :info_content, null: false
      t.integer :info_status, null: false

      t.timestamps
    end
  end
end
