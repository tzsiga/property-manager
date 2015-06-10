class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :property_id, index: true, foreign_key: true
      t.integer :from
      t.integer :to
      t.integer :user_id, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
