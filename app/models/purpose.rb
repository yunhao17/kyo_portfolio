class Purpose < ApplicationRecord

  has_many :spots, dependent: :destroy
  belongs_to :areas
end
