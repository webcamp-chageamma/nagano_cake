class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :cart_items
  has_many :destinations
  enum is_deleted: { 有効: false, 退会: true }


  def name
    last_name + first_name
  end

  def kana_name
    kana_last_name + kana_first_name
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/ }
end
