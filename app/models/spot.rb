class Spot < ApplicationRecord
  
  belongs_to :area
  belongs_to :purpose

  attachment :image
end
