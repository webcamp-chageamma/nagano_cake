class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :commodity

  def sum_of_price
    commodity.add_tax_sales_price * quantity
  end

end
