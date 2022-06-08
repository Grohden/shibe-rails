# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # FIXME(gabriel.rohden): would be better to paginate
    field :tags_by_user, resolver: Resolvers::TagsByUserResolver
    field :user_by_id, resolver: Resolvers::UserByIdResolver
    field :animal_pictures, resolver: Resolvers::AnimalPicturesResolver
    field :animal_pictures_by_id, resolver: Resolvers::AnimalPicturesByIdResolver
    field :animal_pictures_by_user_tag, resolver: Resolvers::AnimalPicturesByUserTagResolver
    field :user_tags_by_animal_picture, resolver: Resolvers::UserTagsByAnimalPictureResolver
  end
end
