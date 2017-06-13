class Carriage < ApplicationRecord
  belongs_to :train

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

  validates :number, presence: true

  protected

  def self.permitted_params
    [:type, :train_id, :number]
  end
end
