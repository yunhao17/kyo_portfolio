class Purpose < ApplicationRecord

  has_many :spots, dependent: :destroy
  
end
