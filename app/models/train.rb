class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tickets
  has_many :carriages, dependent: :destroy

  validates :number, presence: true

  scope :sorted, -> { order(:number) }

  def carriages_count_by_type
    carriages.group(:type).count
  end

  def seats_count_by_type(type, seats_type)
    carriages.where(type: type).sum(seats_type)
  end

  def sorted_carriages
    order_from_end ? carriages.reverse : carriages
  end
end
