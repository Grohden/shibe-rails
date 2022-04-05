class CreatePictureTags < ActiveRecord::Migration[6.1]
  def change
    create_table :picture_tags do |t|
      t.references :animal_picture, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
