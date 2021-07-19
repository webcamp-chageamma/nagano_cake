class Destination < ApplicationRecord

  belongs_to :customer

  validates :postal_code, format: {with: /\A\d{7}\z/ }
  validates :place, presence: true
  validates :name, presence: true

end
