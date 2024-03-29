# frozen_string_literal: true

module Types
  class UserInputType < Types::BaseInputObject
    argument :name, String, required: false
  end
end
