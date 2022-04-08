# frozen_string_literal: true

module Mutations
  class DeleteUserPictureTag < BaseMutation
    description 'Deletes a user_picture_tag by ID'

    field :deleted, Boolean, null: false

    argument :tag_id, ID, required: true
    argument :picture_id, ID, required: true

    def resolve(tag_id:, picture_id:)
      PictureTag.where(tag_id: tag_id, animal_picture_id: picture_id).delete_all

      tag = Tag.find(tag_id)
      tag.destroy if tag.picture_tags.empty?

      { deleted: true }
    end
  end
end
