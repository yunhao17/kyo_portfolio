class Spot < ApplicationRecord
  
  belongs_to :areas
  belongs_to :purposes

  attachment :image
end
