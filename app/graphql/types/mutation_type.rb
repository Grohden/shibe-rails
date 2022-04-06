module Types
  class MutationType < Types::BaseObject
    field :register_animal_pictures, mutation: Mutations::RegisterAnimalPictures
    field :user_create, mutation: Mutations::UserCreate
  end
end
