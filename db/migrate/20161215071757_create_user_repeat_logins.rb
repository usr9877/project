class CreateUserRepeatLogins < ActiveRecord::Migration
  def change
    create_table :user_repeat_logins do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :user_repeat_logins, :user_id
  end
end
