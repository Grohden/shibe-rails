# frozen_string_literal: true

module Resolvers
  class TagsByUserResolver < BaseResolver
    description "Returns a user by id"

    type [Types::TagType], null: false

    argument :user_id, ID, required: true

    def resolve(user_id:)
      Tag.where(user: user_id)
    end
  end
end
