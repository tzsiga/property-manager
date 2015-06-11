class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :property_id, index: true, foreign_key: true, null: false
      t.datetime :from, null: false
      t.datetime :to, null: false
      t.integer :user_id, index: true, foreign_key: true, null: false
      t.datetime null: false
    end
  end
end
