class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  def subtotal
    price * amount
  end
  
  enum making_status: { not_status: 0, middle: 1, complete: 2 }
end
