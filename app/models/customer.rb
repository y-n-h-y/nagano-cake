class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  def full_name
    last_name + first_name
  end
  
  def full_name_kana
    last_name_kana + first_name_kana
  end
  
  def active_for_authentication?
    super && (self.is_active === "vaild")
  end
  
  enum is_active: { vaild: true, invaild: false }
  
  
end
