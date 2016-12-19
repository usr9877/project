class CreateBookrents < ActiveRecord::Migration
  def change
    create_table :bookrents do |t|
      t.integer :book_id
      t.integer :admin_id
      t.integer :user_Id
      t.date :begin_date
      t.date :end_date
      t.integer :status, default: 0
      # 0 huselt irsen   status
      # 1 zeellegdsen.   status
      # 2 butsaan ogson  status
      t.timestamps
    end
    add_index :bookrents, :book_id
    add_index :bookrents, :admin_id
    add_index :bookrents, :user_Id
  end
end
