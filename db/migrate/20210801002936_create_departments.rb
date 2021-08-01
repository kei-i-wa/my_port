class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name,null: false
      t.string :correct_name

      t.timestamps
    end
  end
end
