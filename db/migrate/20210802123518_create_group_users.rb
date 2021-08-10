class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      # 以下の外部キーを保持
      t.references  :user, foreign_key: true
      t.references  :group, foreign_key: true
      t.timestamps
    end
  end
end
