class AnimalPicture < ApplicationRecord
  has_many :picture_tags
  has_many :tags, through: :picture_tags
end
