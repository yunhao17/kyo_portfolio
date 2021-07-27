class Spot < ApplicationRecord

  has_many :spot_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  has_many :favorited_users, through: :favorites, source: :user

  belongs_to :area
  belongs_to :purpose
  belongs_to :user,optional: true

  attachment :image

  #検索機能
  def self.search(keyword)
    @search_spots = Spot.where("name like? OR description like?", "%#{keyword}%", "%#{keyword}%")
  end

end
