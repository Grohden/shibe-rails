# frozen_string_literal: true

module Types
  class AnimalType < Types::BaseEnum
    description "Animal type enum"

    value "shibes"
    value "cats"
    value "birds"
  end
end
