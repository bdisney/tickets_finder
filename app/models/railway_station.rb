class RailwayStation < ApplicationRecord
  has_many :trains

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true, length: { in: 3..20 }, uniqueness: true

  scope :sorted, lambda {
    select('railway_stations.*, railway_stations_routes.position')
      .joins(:railway_stations_routes)
      .order('railway_stations_routes.position').uniq
  }

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  protected

  def station_route(route)
    @station_route ||= RailwayStationsRoute.find_by(route: route, railway_station: self)
  end
end
