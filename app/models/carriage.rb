class Carriage < ApplicationRecord
  belongs_to :train

  VARIATIONS = {economy: 'плацкарт', stateroom: 'купе'}.freeze
  SEATS = {top_seats: 'верхние места', bottom_seats: 'нижние места'}.freeze

end