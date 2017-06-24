class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :railway_stations_routes, [:railway_station_id, :route_id], unique: true,
              name: 'index_unique_pair_of_stations_and_routes'
    add_index :carriages, [:id, :type]
  end
end
