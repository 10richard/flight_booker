class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport
      t.integer :arrival_airport
      t.date :departure_date
      t.string :departure_time
      t.integer :duration

      t.timestamps
    end
  end
end
