class CreateBookingsPassengers < ActiveRecord::Migration
  def change
    create_table :bookings_passengers, id: false do |t|
      t.references :booking
      t.references :passenger

      t.timestamps null: false
    end
    add_index :bookings_passengers, [:booking_id, :passenger_id]
    add_index :bookings_passengers, :passenger_id
  end
end
