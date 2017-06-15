class BusinessCarriage < Carriage
  validates :bottom_seats, numericality: { only_integer: true, greater_than: 0 }
end
