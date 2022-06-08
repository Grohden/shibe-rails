# frozen_string_literal: true

module Resolvers
  class AnimalPicturesResolver < BaseResolver
    description 'All animal pictures'

    type Types::AnimalPictureType.connection_type, null: false

    def resolve
      Connections::SequentialIdConnection.new(AnimalPicture.all)
    end
  end
end
