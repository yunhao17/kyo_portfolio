class Purpose < ApplicationRecord

  has_many :spots, dependent: :destroy
  
  attachment :image
end
