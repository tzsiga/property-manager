class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :property_id
      t.integer :from
      t.integer :to
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
