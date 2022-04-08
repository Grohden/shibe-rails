# frozen_string_literal: true

module Types
  class RegisterTagInputType < Types::BaseInputObject
    argument :name, String, required: false
    argument :user_id, ID, required: false
    argument :picture_id, ID, required: false
  end
end
