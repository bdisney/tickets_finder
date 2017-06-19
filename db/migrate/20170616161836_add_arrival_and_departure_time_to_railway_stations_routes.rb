class AddArrivalAndDepartureTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :arrival_time, :time
    add_column :railway_stations_routes, :departure_time, :time
  end
end
