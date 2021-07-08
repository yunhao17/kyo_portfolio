class Area < ApplicationRecord

  has_many :spots, dependent: :destroy

  attachment :image
end
