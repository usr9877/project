class CreateUsermenus < ActiveRecord::Migration
  def change
    create_table :usermenus do |t|
      t.string :l
      t.string :v
      t.boolean :s, default: 0 

      t.timestamps
    end
  end
end
