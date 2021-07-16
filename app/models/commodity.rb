class Commodity < ApplicationRecord

  has_many :cart_items
  has_many :order_commodities
  has_many :orders, through: :order_commodities
  belongs_to :genre
end
