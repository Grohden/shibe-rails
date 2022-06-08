# frozen_string_literal: true

module Resolvers
  class UserTagsByAnimalPictureResolver < BaseResolver
    type [Types::TagType], null: false

    argument :picture_id, ID, required: true
    argument :user_id, ID, required: true

    def resolve(picture_id:, user_id:)
      Tag.joins(:picture_tags)
        .where(user_id: user_id, picture_tags: { animal_picture_id: picture_id })
    end
  end
end
