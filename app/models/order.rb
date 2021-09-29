class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  def subtotal
    order_detail.price * order_detail.amount
  end
  
  def middle_address
    address + ' ' + name
  end
  
  enum payment: { credit_card: 0, transfer: 1 }
  enum status: { a: 0, b: 1, c: 2, d: 3, e: 4  }
end
