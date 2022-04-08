# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :animal_pictures_by_id, Types::AnimalPictureType, null: false do
      argument :picture_id, ID, required: true
    end
    def animal_pictures_by_id(picture_id:)
      AnimalPicture.find(picture_id)
    end
  end
end
