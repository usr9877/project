class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :kod
      t.string :name
      t.string :ddc
      t.integer :count
      t.string :isbn
      t.string :writer
      t.date :write_date
      t.integer :type_id

      t.timestamps
    end
    add_index :books, :kod
    add_index :books, :type_id
  end
end
