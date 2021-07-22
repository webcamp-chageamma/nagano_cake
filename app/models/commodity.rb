class Commodity < ApplicationRecord

  has_many :cart_items
  has_many :order_commodities
  has_many :orders, through: :order_commodities
  belongs_to :genre
  attachment :image
  
  enum sale_status: { 販売中: 0, 販売停止: 1 }

  validates :image, presence: true
  validates :name, presence: true
  validates :opinion, presence: true
  validates :non_taxed_price, presence: true
  validates :sale_status, presence: true

  def  add_tax_sales_price
    (self.non_taxed_price * 1.10).round
  end

  def self.search_for(content)
    Commodity.where(['name LIKE ?', "%#{content}%"])
  end

  def self.search_genre_for(value)#ここがジャンル検索の部分です。
    Commodity.where(genre_id: value)
  end


end