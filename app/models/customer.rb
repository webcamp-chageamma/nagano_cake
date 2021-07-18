class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders
  has_many :cart_items
  has_many :destinations
  
  def change
    add_column :customers, :is_deleted, :boolean, default: true, null: false
  end
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
