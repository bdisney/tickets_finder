class RailwayStation < ApplicationRecord
  has_many :trains

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true, length: { in: 3..20 }, uniqueness: true
end
