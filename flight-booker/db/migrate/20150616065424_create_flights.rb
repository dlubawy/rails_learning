class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :to_airport_id
      t.integer :from_airport_id
      t.datetime :datetime
      t.integer :duration

      t.timestamps null: false
    end
  end
end
