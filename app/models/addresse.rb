class Addresse < ApplicationRecord
  
  belongs_to :customer, optional: true
end
