class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tickets
  has_many :carriages, dependent: :destroy

  validates :number, presence: true

  def carriages_count_by_type
    self.carriages.group(:variation).count
  end

  def seats_count_by_type(type, seats_type)
    self.carriages.where(variation: type).sum(seats_type)
  end
end
