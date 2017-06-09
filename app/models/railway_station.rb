class RailwayStation < ApplicationRecord
  has_many :trains

  validates :title, presence: true,
            length: { in: 3..20 }
  validates :title, uniqueness: true
end
