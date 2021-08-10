class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :correct_name, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
