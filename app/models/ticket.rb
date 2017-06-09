class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train

  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :last_station,  class_name: 'RailwayStation', foreign_key: :last_station_id

  validates :number, presence: true
end
