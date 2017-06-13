class SittingCarriage < Carriage
  validates :seats, numericality: { only_integer: true, greater_than: 0 }

  def self.permitted_params
    super.insert(-1, :seats)
  end
end
