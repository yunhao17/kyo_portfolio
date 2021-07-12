class Spot < ApplicationRecord
  
  has_many :spot_comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  belongs_to :area
  belongs_to :purpose
  belongs_to :user

  attachment :image
end
