class User < ApplicationRecord
  has_many :tickets

  validates :first_name, :last_name, presence: true
end