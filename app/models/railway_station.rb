class RailwayStation < ApplicationRecord
  has_many :trains

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true, length: { in: 3..20 }, uniqueness: true

  scope :sorted, -> { includes(:routes).order('railway_stations_routes.position') }

  def relation_with(route)
    @record ||= RailwayStationsRoute.find_by(route: route, railway_station: self)
  end

  def update_current_position(route, position)
    current_position = relation_with(route)
    current_position.update(position: position) if current_position
  end
end
