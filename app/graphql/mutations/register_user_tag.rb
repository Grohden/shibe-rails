# frozen_string_literal: true

module Mutations
  class RegisterUserTag < BaseMutation
    description 'Creates a new tag'

    field :tag, Types::TagType, null: false

    argument :tag_input, Types::RegisterTagInputType, required: true

    def resolve(tag_input:)
      effective_tag_name = tag_input[:name].downcase
      tag = Tag.find_or_create_by(name: effective_tag_name, user_id: tag_input[:user_id])
      tag.animal_pictures << AnimalPicture.find(tag_input[:picture_id])

      { tag: tag }
    end
  end
end
