class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, primary_key: true
      t.string :first_name
      t.string :last_name
      t.timestamps null: false
    end
  end
end