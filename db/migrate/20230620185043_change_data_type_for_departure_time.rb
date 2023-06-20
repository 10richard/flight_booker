class ChangeDataTypeForDepartureTime < ActiveRecord::Migration[7.0]

  def self.up
    change_column :flights, :departure_time, :string
  end
  
  def self.down
    change_column :flights, :departure_time, :time
  end
end
