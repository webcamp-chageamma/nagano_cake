class OrderCommodity < ApplicationRecord

  belongs_to :order
  belongs_to :commodity

  enum commodity_status: {着手不可: 0, 製作待ち: 1, 制作中: 2, 製作完了: 3}
end
