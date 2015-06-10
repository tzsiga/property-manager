class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.integer :rooms, null: false
      t.string :facilities, null: false
      t.string :category, null: false
      t.integer :rating, null: false
      t.string :address, null: false
    end
  end
end
