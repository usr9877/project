class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :kod
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :rd
      t.string :phone
      t.string :phone_home

      t.string :password_salt
      t.string :password_hash

      t.timestamps
    end
    add_index :admins, :kod
  end
end
