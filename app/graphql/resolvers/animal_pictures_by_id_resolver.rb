# frozen_string_literal: true

module Resolvers
  class AnimalPicturesByIdResolver < BaseResolver
    type Types::AnimalPictureType.connection_type, null: false

    argument :picture_id, ID, required: true

    def resolve(picture_id:)
      # This is gonna become a single query, no matter how many accesses
      # to this graphql field happen (it batches)
      dataloader.with(Sources::ActiveRecordObject, AnimalPicture).load(picture_id)
    end
  end
end
