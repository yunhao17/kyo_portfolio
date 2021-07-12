class Spot < ApplicationRecord
  
  has_many :spot_comments, dependent: :destroy
  belongs_to :area
  belongs_to :purpose
  belongs_to :user

  attachment :image
end
