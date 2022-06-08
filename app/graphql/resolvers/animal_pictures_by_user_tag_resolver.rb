# frozen_string_literal: true

module Resolvers
  class AnimalPicturesByUserTagResolver < BaseResolver
    type Types::AnimalPictureType.connection_type, null: false

    argument :tag_id, ID, required: true
    argument :user_id, ID, required: true

    def resolve(tag_id:, user_id:)
      AnimalPicture
        .joins(:tags)
        .where(tags: { user_id: user_id }, picture_tags: { tag_id: tag_id })
    end
  end
end
