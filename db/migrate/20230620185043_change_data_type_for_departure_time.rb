class ChangeDataTypeForDepartureTime < ActiveRecord::Migration[7.0]
  def change
    change_column(:flights, :departure_time, :string)
  end

  def up
    change_column(:flights, :departure_time, :string)
  end
  
  def down
    change_column(:flights, :departure_time, :time)
  end
end
