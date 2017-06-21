class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  before_validation :set_title
  validates :title, presence: true

  private

  def set_title
    if railway_stations.size > 1
      self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
    end
  end
end
