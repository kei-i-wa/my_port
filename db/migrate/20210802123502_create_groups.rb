class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :owner_id
      t.string :status, null: false
      t.references :user
      t.timestamps
    end
  end
end
