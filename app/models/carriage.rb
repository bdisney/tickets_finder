class Carriage < ApplicationRecord
  TYPES = {
      EconomyCarriage:  'плацкарт',
      CoupeCarriage:    'купе',
      BusinessCarriage: 'бизнес',
      SittingCarriage:  'сидячий'
  }.freeze

  SEATS = {
      top_seats:        'верхние места',
      bottom_seats:     'нижние места',
      side_top_seats:   'верхние боковые места',
      side_bottom_seats: 'нижние боковые места',
      seats:            'сидячие места'
  }.freeze

  belongs_to :train

  before_validation :set_number
  validates :number, presence: true, uniqueness: { scope: :train_id }

  protected

  def self.permitted_params
    [:type, :train_id, :number]
  end

  def set_number
    self.number ||= train.carriages.maximum(:number).to_i + 1
  end
end
