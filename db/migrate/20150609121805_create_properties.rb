class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :rooms
      t.string :facilities
      t.string :category
      t.integer :rating
      t.string :address

      t.timestamps null: true
    end
  end
end
