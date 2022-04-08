# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :animal_pictures_by_id, Types::AnimalPictureType, null: false do
      argument :picture_id, ID, required: true
    end
    def animal_pictures_by_id(picture_id:)
      AnimalPicture.find(picture_id)
    end

    field :animal_pictures_by_user_tag, Types::AnimalPictureType.connection_type, null: false do
      argument :tag_id, ID, required: true
      argument :user_id, ID, required: true
    end
    def animal_pictures_by_user_tag(tag_id:, user_id:)
      AnimalPicture
        .joins(:tags)
        .where(tags: { user_id: user_id }, picture_tags: { tag_id: tag_id })
    end
  end
end
