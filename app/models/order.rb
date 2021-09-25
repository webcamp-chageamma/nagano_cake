class Order < ApplicationRecord
include ActionView::Helpers

  has_many :order_commodities
  has_many :commodities, through: :order_commodities
  belongs_to :customer

  enum payment: {クレジットカード: 0, 銀行振り込み: 1}
  enum order_status: {入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中: 3, 発送済み: 4}
  
  validates :destination_postal_code, format: {with: /\A\d{7}\z/ }
  validates :destination_address, presence: true
  validates :destination_name, presence: true

  def order_destination_set
    self.destination_postal_code + self.destination_address
  end
end
