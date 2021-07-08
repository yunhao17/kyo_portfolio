class Area < ApplicationRecord

  has_many :spots, dependent: :destroy
  has_many :purposes, dependent: :destroy
  
  attachment :image
end
