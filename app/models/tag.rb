class Tag < ApplicationRecord
  belongs_to :user
  has_many :picture_tags
  has_many :animal_pictures, through: :picture_tags
end
