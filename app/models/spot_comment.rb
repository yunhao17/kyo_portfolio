class SpotComment < ApplicationRecord

  belongs_to :users
  belongs_to :spots
end
