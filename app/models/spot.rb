class Spot < ApplicationRecord

  belongs_to :users
  belongs_to :areas
  belongs_to :purposes
end
