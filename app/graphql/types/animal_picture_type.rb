# frozen_string_literal: true

module Types
  class AnimalPictureType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :animal_type, Types::AnimalType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
