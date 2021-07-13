class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spots, dependent: :destroy
  has_many :spot_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_spots, through: :favorites, source: :spot
end
