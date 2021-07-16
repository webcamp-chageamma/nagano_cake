class OrderCommodity < ApplicationRecord

  belongs_to :order
  belongs_to :commodity
end
