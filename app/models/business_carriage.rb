class BusinessCarriage < Carriage
  validates :bottom_seats, numericality: { only_integer: true, greater_than: 0 }

  def self.permitted_params
    super.insert(-1, :top_seats, :bottom_seats)
  end
end
