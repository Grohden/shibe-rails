class CreateAnimalPictures < ActiveRecord::Migration[6.1]
  def change
    create_table :animal_pictures do |t|
      t.string :url
      t.string :animal_type

      t.timestamps
    end
  end
end
