class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :animal_type
      t.string :image_url
      t.string :name
      t.string :characteristic
      t.datetime :start_time
      t.integer :duration
      t.integer :overall_rating
      t.string :address
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
