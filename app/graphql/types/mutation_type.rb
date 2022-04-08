module Types
  class MutationType < Types::BaseObject
    field :delete_user_picture_tag, mutation: Mutations::DeleteUserPictureTag
    field :register_user_tag, mutation: Mutations::RegisterUserTag
    field :register_animal_pictures, mutation: Mutations::RegisterAnimalPictures
    field :user_create, mutation: Mutations::UserCreate
  end
end
