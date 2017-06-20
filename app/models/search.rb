class Search < ApplicationRecord
  def self.find_train(departure_station, arrival_station)
    return false if departure_station == arrival_station
    check_train(departure_station) & check_train(arrival_station)
  end

  def self.check_train(station_id)
    Train.joins(route: :railway_stations).where(railway_stations: { id: station_id })
  end
end
