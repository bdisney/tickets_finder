class RailwayStation < ApplicationRecord
  has_many :trains

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true, length: { in: 3..20 }, uniqueness: true

  scope :sorted, lambda {
    select('railway_stations.*, railway_stations_routes.position')
      .joins(:railway_stations_routes)
      .order('railway_stations_routes.position')
      .distinct
  }

  def check_station_attr(route, attr)
    value = station_route(route).try(attr)
    return unless value
    RailwayStationsRoute.columns_hash[attr.to_s].type.eql?(:time) ? value.strftime('%H:%M') : value
  end

  def update_position(route, position)
    station_route = station_route(route)
    return unless station_route
    station_route.update(position: position)
  end

  def update_time(route, arrival, departure)
    station_route = station_route(route)
    return unless station_route
    station_route.update(arrival_time: arrival, departure_time: departure)
  end

  protected

  def station_route(route)
    @station_route ||= RailwayStationsRoute.find_by(route: route, railway_station: self)
  end
end
