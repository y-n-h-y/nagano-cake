class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  attachment :image
  
  def tax_price
    (self.price * 1.10).round
  end
  
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  
  enum is_active: { onsale: true, offsale: false }
  
end
