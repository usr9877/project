class CreateMnes < ActiveRecord::Migration
  def change
    create_table :mnes do |t|
      t.string :title
      t.boolean :iss

      t.timestamps
    end
  end
end
