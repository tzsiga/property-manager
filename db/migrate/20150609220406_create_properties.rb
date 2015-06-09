class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :rooms
      t.string :facilities
      t.string :category
      t.integer :rating
      t.string :address

      t.timestamps null: false
    end
  end
end
