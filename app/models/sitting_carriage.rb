class SittingCarriage < Carriage
  validates :seats, numericality: { only_integer: true, greater_than: 0 }
end
