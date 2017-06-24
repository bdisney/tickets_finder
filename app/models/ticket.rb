class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :last_station,  class_name: 'RailwayStation', foreign_key: :last_station_id

  after_create  :send_booking_confirmation
  after_destroy :send_booking_cancellation

  validates :passenger_name, :passport_number, presence: true
  validates :passenger_name, length: { in: 3..50 }
  validates :passport_number, format: { with: /\A\d{4}\s\d{6}\z/ }

  private

  def send_booking_confirmation
    TicketsMailer.booking_confirmation(self).deliver_now
  end

  def send_booking_cancellation
    TicketsMailer.booking_cancellation(self).deliver_now
  end
end
