class PictureTag < ApplicationRecord
  belongs_to :animal_picture
  belongs_to :tag
end
