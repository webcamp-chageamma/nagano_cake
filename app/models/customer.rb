class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders
  has_many :cart_items
  has_many :destinations
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
