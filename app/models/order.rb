class Order < ApplicationRecord
  
  has_many :order_commodities
  has_many :commodities, through: :order_commodities
  belongs_to :customer
end
