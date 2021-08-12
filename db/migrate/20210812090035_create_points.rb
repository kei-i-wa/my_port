class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :giver_id, null: false
      t.integer :getter_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end
  end
end
