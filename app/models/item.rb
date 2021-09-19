class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  attachment :image
  
  def tax_price
    (self.price * 1.10).round
  end
  
end
