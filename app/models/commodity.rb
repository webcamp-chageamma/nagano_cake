class Commodity < ApplicationRecord

  has_many :cart_items
  has_many :order_commodities
  has_many :orders, through: :order_commodities
  belongs_to :genre
  attachment :image
  #販売ステータス　（0= 販売中 / 1= 販売停止中）
  enum sale_status: { good: 0, bad: 1 }

  validates :image, presence: true
  validates :name, presence: true
  validates :opinion, presence: true
  validates :non_taxed_price, presence: true
  validates :sale_status, presence: true

end
