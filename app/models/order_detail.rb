class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  enum making_status: { no: 0, middle: 1, complete: 2 }
end
