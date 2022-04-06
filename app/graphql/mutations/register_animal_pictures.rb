module Mutations
  class RegisterAnimalPictures < BaseMutation
    field :animal_pictures, [Types::AnimalPictureType], null: false

    argument :animal_type, Types::AnimalType, required: true
    argument :count, Int, required: false

    def resolve(animal_type:, count: 10)
      new_pictures = request_pictures(animal_type, count).map do |url|
        AnimalPicture.create(url: url, animal_type: animal_type)
      end

      { animal_pictures: new_pictures }
    end

    private

    def request_pictures(animal_type, count)
      response = Net::HTTP.get_response(
        URI.parse("https://shibe.online/api/#{animal_type}?count=#{count}&urls=true&httpsUrls=true")
      )

      JSON.parse(response.body)
    end
  end
end
