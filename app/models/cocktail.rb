class Cocktail < ApplicationRecord
  validates :name, presence:true, uniqueness: true
  mount_uploader :photo, PhotoUploader

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
