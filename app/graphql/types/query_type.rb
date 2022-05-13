# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :animal_pictures, Types::AnimalPictureType.connection_type, null: false do
      description 'All animal pictures'
    end

    def animal_pictures
      Connections::SequentialIdConnection.new(AnimalPicture.all)
    end

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

    field :user_tags_by_animal_picture, [Types::TagType], null: false do
      argument :picture_id, ID, required: true
      argument :user_id, ID, required: true
    end
    def user_tags_by_animal_picture(picture_id:, user_id:)
      Tag.joins(:picture_tags)
        .where(user_id: user_id, picture_tags: { animal_picture_id: picture_id })
    end

    # FIXME: would be better to paginate
    field :tags_by_user, [Types::TagType], null: false do
      argument :user_id, ID, required: true
    end
    def tags_by_user(user_id:)
      Tag.where(user: user_id)
    end
  end
end
