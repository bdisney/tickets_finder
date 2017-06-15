class EconomyCarriage < Carriage
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats,
            numericality: { only_integer: true, greater_than: 0 }
end
