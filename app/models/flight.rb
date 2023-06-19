class Flight < ApplicationRecord

    belongs_to :airport, optional: true
end
